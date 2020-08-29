//
// Created by aptx4 on 8/28/2020.
//

#include"configs.h"

#include<iostream>
#define CHECK_SET_CONFIG_STRING(parser,config) \
    if(parser.HasKey("",#config)) \
     config = parser.GetConfig("",#config);
#define CHECK_SET_CONFIG_INT(parser,config) \
    if(parser.HasKey("",#config)) \
     config = std::stol(parser.GetConfig("",#config));


 int FILE_READ_SIZE_PER_SEND     = 10240;
 std::string SERVER_NAME         = "EngineD";
 std::string _404_PAGE_PATH      = "";

 int EVSET_SIZE                  = 1000;
 int MAX_CONNECTION_FD           = 1000000;
 int MAX_DATA_LEN_PER_SEND       = 10240;

 int RECV_BUFFER_SIZE            = 20000;
 int IOs_PER_EPOLL               = 4096;

 int         PORT = 10091;
 int         LISTEN_SIZE = 1000;
 std::string ADDRESS = "0.0.0.0";
 std::string MODE = "MT";

 std::map<string,WebsiteConfig> HOST_WEBSITES_MAP;
 int         THREAD_OR_PROCESS_NUM = 0;

 void initGlobalConfigVar()
{
    CConfigParser configParser;
    try {
        configParser.Parser(CONFIG_FILE_PATH);
        CHECK_SET_CONFIG_STRING(configParser,SERVER_NAME);
        CHECK_SET_CONFIG_STRING(configParser,ADDRESS);
        CHECK_SET_CONFIG_STRING(configParser,MODE);
        CHECK_SET_CONFIG_INT(configParser,PORT);
        CHECK_SET_CONFIG_INT(configParser,EVSET_SIZE);
        CHECK_SET_CONFIG_INT(configParser,MAX_CONNECTION_FD);
        CHECK_SET_CONFIG_INT(configParser,MAX_DATA_LEN_PER_SEND);
        CHECK_SET_CONFIG_INT(configParser,RECV_BUFFER_SIZE);
        CHECK_SET_CONFIG_INT(configParser,IOs_PER_EPOLL);
        CHECK_SET_CONFIG_INT(configParser,THREAD_OR_PROCESS_NUM);
        CHECK_SET_CONFIG_INT(configParser,LISTEN_SIZE);
        CHECK_SET_CONFIG_STRING(configParser,_404_PAGE_PATH);

    } catch (...) {
        std::cout<<"error:"<<"file:"<<CONFIG_FILE_PATH<<"cant find"<<std::endl;

    }
    try {
        configParser.Clear();
        configParser.Parser(WEBSITES_HOST_CONFIG);
        std::vector<string> sections;
        configParser.GetSections(sections);
        for(auto &i : sections)
        {
            if(i.empty())
                continue;
            try {
                WebsiteConfig websiteConfig;
                auto &conf = *configParser.GetSectionConfig(i);
                websiteConfig.websiteRoot = conf["WEBSITE_ROOT"];
                websiteConfig._404PagePath = conf["404_PAGE_PATH"];
                websiteConfig.indexPageUrl = conf["INDEX_PAGE_URL"];
                HOST_WEBSITES_MAP[i] = websiteConfig;
            } catch (...) {

            }
        }
        auto res = configParser.GetSectionConfig("");
    } catch (...) {
        std::cout<<"error:"<<"file:"<<WEBSITES_HOST_CONFIG<<"cant find"<<std::endl;
    }
    //special values;
    if(THREAD_OR_PROCESS_NUM == 0)
    {
        THREAD_OR_PROCESS_NUM = get_nprocs_conf()+2; //cpus
    }

}