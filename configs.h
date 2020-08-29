//
// Created by aptx4 on 8/28/2020.
//

#ifndef MEMORYPOOL_CONFIGS_H
#define MEMORYPOOL_CONFIGS_H
#include<map>
#include<string>
#include <sys/sysinfo.h>

#include "config_parser/ConfigParser.h"

#define FIFO_SEND_BUF_BLOCK_SIZE 10240
#define CONFIG_FILE_PATH "/EngineD/server.config"
#define WEBSITES_HOST_CONFIG "/EngineD/websites.config"
#define DEFAULT_404_PAGE "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1252\"><title>404 Not Found</title></head>"\
"<body>"\
"<center><h1>404 Not Found</h1></center>"\
"<hr><center>EgineD</center>"\
"</body></html> "

struct WebsiteConfig
{
    std::string websiteRoot;
    std::string _404PagePath;
    std::string indexPageUrl;

};


extern    int FILE_READ_SIZE_PER_SEND;
extern    std::string SERVER_NAME;
extern    std::string _404_PAGE_PATH;

extern    int EVSET_SIZE;
extern    int MAX_CONNECTION_FD;
extern    int MAX_DATA_LEN_PER_SEND;

extern    int RECV_BUFFER_SIZE;
extern    int IOs_PER_EPOLL;

extern    int         PORT;
extern    int         LISTEN_SIZE;
extern    std::string ADDRESS ;
extern    std::string MODE;

extern    std::map<string,WebsiteConfig> HOST_WEBSITES_MAP;
extern    int         THREAD_OR_PROCESS_NUM ;


extern    void initGlobalConfigVar();





#endif //MEMORYPOOL_CONFIGS_H
