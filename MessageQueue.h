//
// Created by Danny on 2020/8/14.
//

#ifndef MEMORYPOOL_MESSAGEQUEUE_H
#define MEMORYPOOL_MESSAGEQUEUE_H

#include"MemoryPool.h"
#include"RawList.h"
#include<exception>
#include<mutex>
#include<condition_variable>

#include<iostream>

template <typename Msg>
class MsgNode
{
public:
    Msg msgBody;
    MsgNode(const Msg & msg);
    friend class RawList<MsgNode<Msg> >;
protected:
    MsgNode* next;
    MsgNode* last;
};



template <typename Msg>
class MessageQueue
{
public:
    explicit MessageQueue(int maxLen=-1);
    ~MessageQueue();
    inline bool empty();
    inline size_t size();
    Msg wait();
    void push(const Msg & msg);
private:
    int maxLength;
    std::mutex lock;
    std::condition_variable cond;
    std::condition_variable surplusCond;
    RawList<MsgNode<Msg> > list;
    static std::mutex poolLock;
    static MemoryPool<MsgNode<Msg> >msgNodePool;
};

template<typename Msg>
MsgNode<Msg>::MsgNode(const Msg &msg):msgBody(msg)
{

}

template<typename Msg>
MessageQueue<Msg>::MessageQueue(int maxLen):list(),maxLength(maxLen)
{

}

template<typename Msg>
Msg MessageQueue<Msg>::wait()
{
    std::unique_lock<decltype(this->lock)> guard(this->lock);
    while (true)
    {
        if(this->list.size())
        {
            auto x = this->list.front();
            Msg ret = x->msgBody;
            this->list.popFront();
            this->poolLock.lock();
            this->msgNodePool.recycle(x);
            this->poolLock.unlock();
            this->surplusCond.notify_one();
            return ret;
        }
        else
        {
            this->cond.wait(guard);
        }
    }
}

template<typename Msg>
void MessageQueue<Msg>::push(const Msg &msg)
{
    std::unique_lock<decltype(this->lock)> guard(this->lock);
    while(true)
    {
        if(this->maxLength==-1||this->list.size()<this->maxLength)
        {
            this->poolLock.lock();
            this->list.pushBack(new(this->msgNodePool.alloc()) MsgNode<Msg>(msg));
            this->poolLock.unlock();
            this->cond.notify_one();
            return;
        }
        else
        {
            this->surplusCond.wait(guard);
        }
    }
}

template<typename Msg>
size_t MessageQueue<Msg>::size()
{
    std::lock_guard<decltype(this->lock)> guard(this->lock);
    return this->list.size();
}

template<typename Msg>
bool MessageQueue<Msg>::empty()
{
    std::lock_guard<decltype(this->lock)> guard(this->lock);
    return !this->list.size();
}

template<typename Msg>
MessageQueue<Msg>::~MessageQueue()
{
    while(!this->empty())
    {
        this->wait();
    }
}

template <typename Msg>
MemoryPool<MsgNode<Msg> > MessageQueue<Msg>::msgNodePool(100,5);

template <typename Msg>
std::mutex MessageQueue<Msg>::poolLock;

#endif //MEMORYPOOL_MESSAGEQUEUE_H
