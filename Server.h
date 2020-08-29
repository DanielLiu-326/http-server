//
// Created by aptx4 on 8/28/2020.
//

#ifndef MEMORYPOOL_SERVER_H
#define MEMORYPOOL_SERVER_H

#include"Worker.h"
#include<thread>
#include"WorkGroup.h"
#include"mainWorkCore.h"
#include"configs.h"
struct ServerInitErr:std::exception
{
    std::string error;
    ServerInitErr(const std::string& error):error(error)
    {}
    virtual const char *what()const noexcept
    {
        return error.c_str();
    }
};
class Server
{
public:
    void init();
    void run();
    WorkGroup<mainWorkCore>* workerGroup;
private:
    int listenFd;
};


#endif //MEMORYPOOL_SERVER_H
