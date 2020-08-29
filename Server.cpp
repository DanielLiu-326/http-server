//
// Created by aptx4 on 8/28/2020.
//

#include "Server.h"

void Server::init()
{
    initGlobalConfigVar();
    signal(SIGPIPE, SIG_IGN);
    int fd = socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
    if(fd<0)
    {
        throw ServerInitErr("socket()");
    }
    sockaddr_in address;
    address.sin_addr.s_addr = inet_addr(ADDRESS.c_str());
    address.sin_port = htons(PORT);
    address.sin_family = AF_INET;
    int res = bind(fd,(sockaddr*)&address,sizeof(sockaddr_in));
    if(res<0)
    {
        throw ServerInitErr("bind()");
    }
    res = listen(fd,LISTEN_SIZE);
    if(res < 0 )
    {
        throw ServerInitErr("listen()");
    }
    WorkGroup<mainWorkCore>::Mode mode;
    if(MODE=="MT")
    {
        mode =WorkGroup<mainWorkCore>::Mode::MT;
    }
    else
    {
        mode =WorkGroup<mainWorkCore>::Mode::MP;
    }
    this->workerGroup = new WorkGroup<mainWorkCore>(mode);
    workerGroup->init(THREAD_OR_PROCESS_NUM,fd);



}

void Server::run()
{
    while(true)
    {
        char temp[100]{};
        std::cin.getline(temp,sizeof(temp));
        if(std::string(temp)=="stop")
        {
            workerGroup->stopN(THREAD_OR_PROCESS_NUM);
            std::cout<<"have a good time"<<std::endl;
            return;
        }
    }

}
