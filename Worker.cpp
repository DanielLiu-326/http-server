//
// Created by Danny on 2020/8/14.
//

#include "Worker.h"
Worker::Worker(WorkerCore* core, int listenFd,int & CtlR,int &CtlW,int epSize):
listenFd(listenFd),
epSize(epSize),
workerCore(core),
quitSig(false)
{
    int temp[2];
    pipe(temp);
    CtlR = temp[0];
    wPipe = temp[1];
    pipe(temp);
    CtlW = temp[1];
    rPipe = temp[0];

}

void Worker::init()
{
    bool flag = false;
    do
    {
        if((this->epfd = epoll_create(this->epSize))<0)
        {
            flag = true;
            break;
        }
        epoll_event ev{};
        ev.events = EPOLLIN;
        ev.data.fd= this->rPipe;
        if(epoll_ctl(epfd,EPOLL_CTL_ADD,this->rPipe,&ev)<0)
        {
            flag= true;
            break;
        }

        ev.events = EPOLLIN;
        ev.data.fd = this->listenFd;
        this->setNonblock(this->listenFd);
        if(epoll_ctl(epfd,EPOLL_CTL_ADD,this->listenFd,&ev)<0)
        {
            flag= true;
            break;
        }

        this-> evSet = new epoll_event[EVSET_SIZE];
        this->sessions = new Session*[MAX_CONNECTION_FD+1];
        memset(this->sessions,0,MAX_CONNECTION_FD+1);
        this->buffer = new char[RECV_BUFFER_SIZE];
    }while (0);
    if(flag)
    {
        //error occurred;
        this->workerCore->onWorkerInitErr();
        std::cerr<<"WorkerInitErr"<<std::endl;
        exit(-1);
    }
}

void Worker::work()
{
    while (true)
    {
        if(this->quitSig)
        {
            break;
        }
        int evNum = waitEvent();
        for(int i = 0;i<evNum;i++)
        {
            if(evSet[i].events&EPOLLIN)
            {
                this->onEpIN(evSet[i].data.fd);
            }
            if(evSet[i].events&EPOLLOUT)
            {
                this->onEpOUT(evSet[i].data.fd);
            }
        }
        for(int i = 0;i<IOs_PER_EPOLL&&this->handleList.size();i++)
        {
            this->handleIN();
            this->handleOUT();
        }
    }
}

inline int Worker::waitEvent()
{
    if(!this->handleList.size())
    {
        //no event wait in handle list to be handle
        return epoll_wait(this->epfd,this->evSet,EVSET_SIZE,1000); // timeout infinity;
    }
    else
    {
        return epoll_wait(this->epfd,this->evSet,EVSET_SIZE,0);
    }
}

inline void Worker::onEpIN(int fd)
{
    if(fd == this->listenFd)// new connection
    {
        epoll_event ev;
        socklen_t length = sizeof(sockaddr_in);
        sockaddr_in address;
        int newfd = accept(this->listenFd,(sockaddr*)&address,&length);
        if(newfd<0) // newfd<0
        {
            return;
        }
        sessions[newfd] = new Session();
        sessions[newfd]->address= address;
        sessions[newfd]->fd = newfd;
        int res=this->setNonblock(newfd);
        ev.data.fd = newfd;
        ev.events = EPOLLIN|EPOLLET|EPOLLOUT;
        res = epoll_ctl(this->epfd,EPOLL_CTL_ADD,newfd,&ev);
        this->onSessionEst(sessions[newfd]);
    }
    else if(fd==this->rPipe)// command;
    {
        CtlMsg ctlMsg;
        int readSize = read(this->rPipe,&ctlMsg,sizeof(ctlMsg));
        if(readSize>0)
        {
            this->onCtlMsg(ctlMsg);
        }
        return;
    }
    else//io msg
    {
        sessions[fd]->readable = true;
        this->handleList.remove(sessions[fd]);
        this->handleList.pushBack(sessions[fd]);
    }
}

int Worker::setNonblock(int fd)
{
    int flags = fcntl(fd, F_GETFL, 0);
    return fcntl(fd, F_SETFL, flags|O_NONBLOCK);
}

inline void Worker::handleIN()
{
    char buffer[10000];
    for(auto i = this->handleList.begin();i!=this->handleList.end();)
    {
        if(i->closeFlag&&i->sendBuffer.empty())
        {
            int fd = i->fd;
            ++i;
            this->sessClose(fd);
            continue;
        }
        if(i->readable)
        {
            errno = 0;
            int recvLen = recv(i->fd,buffer,sizeof(buffer),MSG_NOSIGNAL);
            if(recvLen==0||(recvLen<0&&errno!=EAGAIN))
            {
                //disconnect;
                int fd = i->fd;
                ++i;
                this->sessClose(fd);
                continue;
            }
            else if(recvLen<0)
            {
                // e again
                i->readable = false;
                if((!i->writeable||i->sendBuffer.empty())&&!i->closeFlag)
                {
                    //no data to send and read;
                    i = this->handleList.remove(i);
                    continue;
                }
            }
            else
            {
                this->onDataIn(buffer,recvLen,i.ptr);
            }
        }
        else
        {
            if(!i->readable&&(!i->writeable&&i->sendBuffer.empty())&&!i->closeFlag)
            {
                //no data to send and read;
                i = this->handleList.remove(i);
                continue;
            }
        }
        ++i;
    }
}

inline void Worker::onEpOUT(int fd)
{
    if(sessions[fd]->writeable)
    {
        return;
    }
    else
    {
        if(!sessions[fd]->sendBuffer.empty())
        {
            sessions[fd]->writeable = true;
            this->handleList.remove(sessions[fd]);
            this->handleList.pushBack(sessions[fd]);
        }
    }
}

inline void Worker::handleOUT()
{
    for(auto i = this->handleList.begin();i!=this->handleList.end();)
    {
        if(i->closeFlag&&i->sendBuffer.empty())
        {
            int fd = i->fd;
            ++i;
            this->sessClose(fd);
            continue;
        }
        if(i->writeable)
        {
            errno = 0;
            int writeLen = i->sendBuffer.writeOut(i->fd,MAX_DATA_LEN_PER_SEND);
            if(writeLen<0)//error
            {
                //disconnect;
                int fd = i->fd;
                ++i;
                this->sessClose(fd);
                continue;
            }
            else if(i->sendBuffer.empty()&&!i->closeFlag)
            {
                //no more data to send;
                auto temp = i.ptr;
                i->writeable = false;
                i = this->handleList.remove(i);
                this->onSessionSended(temp);
                continue;
            }
            else
            {
                // still have data or wait to be closed;
                if(errno == EAGAIN)
                {
                    i->writeable = false;
                    i = this->handleList.remove(i);
                    continue;
                }
            }
        }
        ++i;
    }
}

inline void Worker::onDataIn(char *data, int length,Session * session)
{
    this->workerCore->onDataIN(data,length,session);
}



inline void Worker::onSessionEst(Session *session)
{
    this->workerCore->onSessionEstablish(session);
}

inline void Worker::onSessionClose(Session *session)
{
    this->workerCore->onSessionClose(session);
}

void Worker::final()
{
    for(int i = 0;i<=MAX_CONNECTION_FD;i++)
    {
        if(sessions[i])
            this->sessClose(sessions[i]->fd);
    }
    delete[] this->evSet;
    delete[] this->sessions;
    delete[] this->buffer;
}



inline  void Worker::onCtlMsg(CtlMsg &msg)
{
    switch (msg.type)
    {
        case CtlMsg::Type::closeSess:
        {
            this->sessClose(msg.msgBody.closeSessMsg.fd);
        }break;
        case CtlMsg::Type::quit:
        {
            this->quitSig = true;
        }break;
    }
}

inline void Worker::sessClose(int fd)
{
    if(!sessions[fd])
        return;
    this->onSessionClose(sessions[fd]);
    close(fd);
    auto temp = sessions[fd];
    this->sessions[fd] = nullptr;
    this->handleList.remove(temp);
    epoll_ctl(this->epfd,EPOLL_CTL_DEL,fd,NULL);
    delete temp;
}

inline void Worker::onSessionSended(Session*session)
{
    this->workerCore->onSessionSended(session);
}




Session::Session():
readable(false),
writeable(false),
next(0),
last(0),
closeFlag(false)
{

}
