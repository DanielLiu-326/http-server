//
// Created by Danny on 2020/8/14.
//

#ifndef MEMORYPOOL_WORKER_H
#define MEMORYPOOL_WORKER_H
#include"configs.h"
#include<iostream>
#include"MemoryPool.h"
#include<cstring>
#include"FifoBuffer.h"
#include<mutex>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<fcntl.h>
#include<sys/epoll.h>

class Session
{
public:
    Session();
    int fd;
    sockaddr_in address;
    bool readable;
    bool writeable;
    FifoBuffer<FIFO_SEND_BUF_BLOCK_SIZE> sendBuffer;
    friend class RawList<Session>;
    bool closeFlag;
private:
    Session * next;
    Session * last;
};
struct CtrlMsg
{

};

class Worker;
class WorkerCore
{
public:
    virtual void init(Worker* worker)
    {
        this->worker = worker;
    }
    virtual void onDataIN(char * data,int length,Session* session)=0;
    virtual void onSessionEstablish(Session *session)=0;
    virtual void onSessionClose(Session* session)=0;
    virtual void onWorkerInitErr()=0;
    virtual void onSessionSended(Session * session)=0;
protected:
    Worker *worker;
private:
};
struct CtlMsg
{
    enum class Type
    {
        closeSess,
        quit,
    };
    struct CloseSessMsg
    {
        int fd;
    };
    struct QuitMsg
    {

    };
    union MsgBody
    {
        CloseSessMsg closeSessMsg;
        QuitMsg      quitMsg;
    };
    Type type;
    MsgBody msgBody;
};

class Worker{

public:
    //outer interfaces;
                Worker(WorkerCore* core, int listenFd,int & CtlR,int &CtlW,int epSize);
    void                init();
    void                final();
    void                work();
    inline void         sendData(int fd,const char * data,int length);
    inline void         closeSess(int fd);
    inline int          sendFromFile(int fromFd,int fd,int length);
    int                 epfd;
    int                 epSize;
    RawList<Session>    handleList;
    epoll_event *       evSet;
    Session **          sessions;
    WorkerCore*         workerCore;
    char*       buffer;
private:
    int     listenFd;
    int     rPipe;
    int     wPipe;
    //sigs;
    bool    quitSig;
    static int         setNonblock(int fd);
    //ep event
    inline void        onEpIN(int fd);
    inline void        onEpOUT(int fd);
    inline void        onCtlMsg(CtlMsg & msg);
    //inner event
    inline void        onDataIn(char * data,int length,Session * session);
    inline void        onSessionEst(Session * session);
    inline void        onSessionClose(Session* session);
    inline void        onSessionSended(Session* session);
    // inner function
    inline int         waitEvent();
    inline void        handleIN();
    inline void        handleOUT();
    inline void        sessClose(int fd); // inner
    //other operation;
    inline void epDELw(int fd);
    inline void epADDw(int fd);
};

inline void Worker::sendData(int fd,const char * data,int length)
{
    if(sessions[fd])
    {
        sessions[fd]->writeable = true;
        sessions[fd]->sendBuffer.writeIn(data,length);
        this->handleList.remove(sessions[fd]);
        this->handleList.pushBack(sessions[fd]);
    }
}

inline void Worker::closeSess(int fd)
{
    sessions[fd]->closeFlag = true;
    this->handleList.remove(sessions[fd]);
    this->handleList.pushFront(sessions[fd]);
}

inline void Worker::epDELw(int fd)
{
    epoll_event ev;
    ev.events   =   EPOLLIN|EPOLLET;
    ev.data.fd  =   fd;
    epoll_ctl(this->epfd,EPOLL_CTL_MOD,fd,&ev);
}

inline void Worker::epADDw(int fd)
{
    epoll_event ev;
    ev.events   =   EPOLLIN|EPOLLOUT|EPOLLET;
    ev.data.fd  =   fd;
    epoll_ctl(this->epfd,EPOLL_CTL_MOD,fd,&ev);
}

inline int Worker::sendFromFile(int fromFd,int fd,int length)
{
    if(!this->sessions[fd])
    {
        return -1;
    }
    int len;
    len = this->sessions[fd]->sendBuffer.writeInFromFile(fromFd,length);
    sessions[fd]->writeable = true;
    this->handleList.remove(sessions[fd]);
    this->handleList.pushBack(sessions[fd]);
    return len;
}

#endif //MEMORYPOOL_WORKER_H
