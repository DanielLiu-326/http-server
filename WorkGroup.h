//
// Created by Danny on 2020/8/25.
//

#ifndef MEMORYPOOL_WORKGROUP_H
#define MEMORYPOOL_WORKGROUP_H
#include"Worker.h"
#include<sys/types.h>
#include<sys/wait.h>
struct WorkerData
{
    int         wPipe;
    int         rPipe;
    Worker *    worker;
    std::thread*thread;
    int         process;

};
template <typename workerCore>
class WorkGroup
{
public:
    enum class Mode
    {
        MP,//multi process
        MT,//multi thread;
    };
    WorkGroup(Mode mode);
    void init(int workerN,int listenfd);

    void addN(int n);
    void addOne();
    int stopN(int n);
    void stopOne();

    void mtCirculate(WorkerData *worker);
    void mpCirculate(WorkerData *worker);
    void mpInit(WorkerData* data);
    void mtInit(WorkerData* data);
    std::list<WorkerData*> workers;

private:
    Mode mode;
    int listenfd;

};

template<typename workerCore>
WorkGroup<workerCore>::WorkGroup(WorkGroup::Mode mode):
mode(mode)
{

}

template<typename workerCore>
void WorkGroup<workerCore>::init(int workerN,int  listenfd)
{
    this->listenfd = listenfd;
    this->addN(workerN);
}

template<typename workerCore>
void WorkGroup<workerCore>::addN(int n)
{
    for(int i = 0;i<n;i++)
    {
        WorkerData *data = new WorkerData;
        auto p = new Worker(new workerCore,this->listenfd,data->rPipe,data->wPipe,1000);
        data->worker =p;
        data->worker->workerCore->init(data->worker);
        if(this->mode == Mode::MP)
        {
            this->mpInit(data);
        }
        else
        {
            this->mtInit(data);
        }
        this->workers.push_back(data);
    }
}

template<typename workerCore>
void WorkGroup<workerCore>::addOne()
{
    this->addN(1);
}

template<typename workerCore>
int WorkGroup<workerCore>::stopN(int n)
{
    std::cout<<"stoping "<<n<<std::endl;
    CtlMsg ctlMsg;
    ctlMsg.type = CtlMsg::Type::quit;
    auto it = this->workers.begin();
    int i = 0;
    for(;i<n&&it!=workers.end();i++)
    {
        if(write((*it)->wPipe,&ctlMsg,sizeof(ctlMsg))>0)
        {
            if(this->mode == Mode::MP)
            {
                //multi process;
                waitpid((*it)->process,0,NULL);
            }
            else
            {
                //multi thread
                (*it)->thread->join();
                delete (*it)->thread;
            }
            delete (*it)->worker->workerCore;
            delete (*it)->worker;
            delete (*it);
            it = this->workers.erase(it);
        }
        else
        {
            //error
            ++it;
        }
    }
    return i;
}

template<typename workerCore>
void WorkGroup<workerCore>::stopOne()
{
    this->stopN(1);
}

template<typename workerCore>
void WorkGroup<workerCore>::mtCirculate(WorkerData* workerData)
{
    workerData->worker->init();
    workerData->worker->work();
    workerData->worker->final();
}

template<typename workerCore>
void WorkGroup<workerCore>::mpCirculate(WorkerData *workerData)
{
    workerData->worker->init();
    workerData->worker->work();
    exit(0);
}

template<typename workerCore>
void WorkGroup<workerCore>::mpInit(WorkerData *data)
{
    int pid = fork();
    if(pid<0)
    {
        //error occurred

        return;
    }
    if(pid >0)
    {
        //main
        data->process = pid;
        return;
    }
    else
    {
        //child
        this->mpCirculate(data);
    }
}

template<typename workerCore>
void WorkGroup<workerCore>::mtInit(WorkerData *data)
{
    data->thread = new std::thread(&WorkGroup<workerCore>::mtCirculate,this,data);
    return;
}


#endif //MEMORYPOOL_WORKGROUP_H
