//
// Created by aptx4 on 8/28/2020.
//

#include"mainWorkCore.h"
void mainWorkCore::onDataIN(char *data, int length, Session *session)
{
    if(!this->sessionDatas[session->fd])
    {
        return;
    }
    try
    {
        if(sessionDatas[session->fd]->busy())
            throw std::exception();
        http::BufferedRequest& request = this->sessionDatas[session->fd]->reqBuffer;
        int requests = 0;
        std::size_t size = length;
        for (; (size > 0); ++requests)
        {
            // Parse as much data as possible.
            std::size_t used = 0;
            while ((size > 0) && !request.complete())
            {
                std::size_t pass = request.feed(data, size);
                used += pass, data += pass, size -= pass;
            }
            // Check that if we've parsed an entire request.
            if(request.complete())
            {
                //Do what the fuck you what;
                this->onRequest(session,request);
                request.clear();
            }
        }
    }
    catch (...)
    {
        //the data of the client sent is invalid;
        this->worker->closeSess(session->fd);
    }


}

void mainWorkCore::onSessionEstablish(Session *session)
{
    this->sessionDatas[session->fd] = new SessionData;
}

void mainWorkCore::onSessionClose(Session *session)
{
    this->onConnectionClose(session);
    delete this->sessionDatas[session->fd];
    this->sessionDatas[session->fd] = nullptr;
}

void mainWorkCore::onWorkerInitErr()
{
}

void mainWorkCore::onSessionSended(Session *session)
{
    if(sessionDatas[session->fd]->chunckedSendingFile!=-1)
    {
        this->sendFileChunk(session);
    }
    if(sessionDatas[session->fd]->rawSendingFile!= -1)
    {
        this->sendFilePart(session);
    }
}

void mainWorkCore::sendFileChunk(Session *session)
{
    int& fp = sessionDatas[session->fd]->chunckedSendingFile;
    if(fp<0)
    {
        return;
    }
    int readLen = read(fp , this->fileBuffer , FILE_READ_SIZE_PER_SEND);
    if(readLen<=0)
    {
        //eof
        sendChunk(session,NULL,0);//send "\r\n0\r\n"
        close(fp);
        fp = -1;
    }
    else
    {
        sendChunk(session,this->fileBuffer,readLen);
    }
}

inline void mainWorkCore::sendChunk(Session *session, const char *data, int dataLen)
{
    std::ostringstream tempStream;
    tempStream<<std::hex<<dataLen<<"\r\n";
    this->worker->sendData(session->fd,tempStream.str().c_str(),tempStream.str().length());
    tempStream.str("");// clear stream
    if(dataLen)
        this->worker->sendData(session->fd,data,dataLen);
    else
        tempStream<<"\r\n";
    tempStream<<"\r\n";
    this->worker->sendData(session->fd,tempStream.str().c_str(),tempStream.str().length());
}

void mainWorkCore::sendFileByChunks(std::string filePath, Session *session)
{
    this->sessionDatas[session->fd]->chunckedSendingFile = ::open(filePath.c_str(),O_RDONLY);
    this->sendFileChunk(session);
}

mainWorkCore::mainWorkCore()
{
    this->sessionDatas = new SessionData*[MAX_CONNECTION_FD+1];
    memset(this->sessionDatas,0,MAX_CONNECTION_FD+1);
    this->fileBuffer = new char[FILE_READ_SIZE_PER_SEND];
}

inline void mainWorkCore::rawSend(Session *session, const char *rawData, int length)
{
    this->worker->sendData(session->fd,rawData,length);
}

void mainWorkCore::responseFileChunked(std::string path, Session *session)
{
    //buid headers;
    http::Message::Headers header{
            {"Server"           ,SERVER_NAME},
            {"Transfer-Encoding","chunked"},
            //{"Content-Type","application/octet-stream"},
            {"Connection","keep-alive"},
    };

    http::ResponseBuilder builder;
    builder.set_major_version(1);
    builder.set_minor_version(1);
    builder.set_status(200);
    builder.headers() = header;
    auto && buf = builder.to_string();
    this->worker->sendData(session->fd,buf.c_str(),buf.length());
    this->sendFileByChunks(path,session);
}

void mainWorkCore::onRequest(Session *session, http::BufferedRequest &request)
{
    switch (request.method())
    {
        case HTTP_DELETE:
            break;
        case HTTP_GET:
        {
            //this->responseFileChunked(std::string(WWW_ROOT)+request.url(),session);
            this->onHttpGet(session,request);
        }break;
        case HTTP_HEAD:
            break;
        case HTTP_POST:
            break;
        case HTTP_PUT:
            break;
        case HTTP_CONNECT:
            break;
        case HTTP_OPTIONS:
            break;
        case HTTP_TRACE:
            break;
        case HTTP_COPY:
            break;
        case HTTP_LOCK:
            break;
        case HTTP_MKCOL:
            break;
        case HTTP_MOVE:
            break;
        case HTTP_PROPFIND:
            break;
        case HTTP_PROPPATCH:
            break;
        case HTTP_SEARCH:
            break;
        case HTTP_UNLOCK:
            break;
        case HTTP_REPORT:
            break;
        case HTTP_MKACTIVITY:
            break;
        case HTTP_CHECKOUT:
            break;
        case HTTP_MERGE:
            break;
        case HTTP_MSEARCH:
            break;
        case HTTP_NOTIFY:
            break;
        case HTTP_SUBSCRIBE:
            break;
        case HTTP_UNSUBSCRIBE:
            break;
        case HTTP_PATCH:
            break;
        case HTTP_PURGE:
            break;
    }
}

void mainWorkCore::onConnectionClose(Session *session)
{

}

void mainWorkCore::responseFile(std::string path, Session *session)
{
    http::Message::Headers header{
            {"Server"           ,SERVER_NAME},
            //{"Content-Type","application/octet-stream"},
            {"Connection","keep-alive"},
    };
    http::ResponseBuilder builder;
    builder.set_major_version(1);
    builder.set_minor_version(1);
    header["Content-Length"] = std::to_string(file_size(path.c_str()));
    builder.set_status(200);
    builder.headers() = header;
    auto && buf = builder.to_string();
    this->worker->sendData(session->fd,buf.c_str(),buf.length());
    this->rawSendFile(path,session);
}

inline int mainWorkCore::rawSendFile(const std::string& path, Session *session)
{
    int fileFd = open(path.c_str(),O_RDONLY);
    if(fileFd>0)
    {
        this->sessionDatas[session->fd]->rawSendingFile = fileFd;
        this->sendFilePart(session);
    }
}

void mainWorkCore::sendFilePart(Session *session)
{
    int& fp = sessionDatas[session->fd]->rawSendingFile;
    if(fp<0)
    {
        return;
    }
    //int len = session->sendBuffer.writeInFromFile(fp,FILE_BUFFER_SIZE);
    //this->worker->sendData(session->fd,"",0);
    int len = worker->sendFromFile(fp,session->fd,FILE_READ_SIZE_PER_SEND);
    if(len <= 0)
    {
        //eof or errors;
        close(fp);
        fp = -1;
        this->worker->sendData(session->fd,"\r\n",strlen("\r\n"));

    }
}

mainWorkCore::~mainWorkCore()
{
    delete[] this->fileBuffer;
    this->fileBuffer = nullptr;
    delete[] this->sessionDatas;
}

void mainWorkCore::onHttpGet(Session *session, http::BufferedRequest &request) {

    std::string host ,webRoot;
    WebsiteConfig siteConfig;
    try {

        host = request.headers().at("Host");
        siteConfig = HOST_WEBSITES_MAP.at(host);
        webRoot = siteConfig.websiteRoot;
    } catch (...) {
        this->worker->closeSess(session->fd);
        return;
    }
    std::string path;
    if(request.url()=="/")
    {
         path = webRoot+siteConfig.indexPageUrl;
    }else
    {
        path = webRoot+request.url();
    }
    if(access(path.c_str(),R_OK)<0||!isReadableFile(path))
    {
        http::Message::Headers header{
                {"Server"           ,SERVER_NAME},
                //{"Content-Type","application/octet-stream"},
                {"Connection","keep-alive"},
        };
        http::ResponseBuilder builder;
        builder.set_major_version(1);
        builder.set_minor_version(1);
        builder.set_status(404);
        if(!siteConfig._404PagePath.empty()&&isReadableFile(siteConfig._404PagePath.c_str()))
        {
            header["Content-Length"] = std::to_string(file_size(siteConfig._404PagePath.c_str()));
            builder.headers() = header;
            auto && buf = builder.to_string();
            this->worker->sendData(session->fd,buf.c_str(),buf.length());
            this->rawSendFile(siteConfig._404PagePath.c_str(),session);
        }else if(_404_PAGE_PATH.empty()||!isReadableFile(_404_PAGE_PATH))
        {
            header["Content-Length"] = strlen(DEFAULT_404_PAGE);
            builder.headers() = header;
            auto && buf = builder.to_string();
            this->worker->sendData(session->fd,buf.c_str(),buf.length());
            this->worker->sendData(session->fd,DEFAULT_404_PAGE,strlen(DEFAULT_404_PAGE));
        }
        else
        {
            header["Content-Length"] = std::to_string(file_size(_404_PAGE_PATH.c_str()));
            builder.headers() = header;
            auto && buf = builder.to_string();
            this->worker->sendData(session->fd,buf.c_str(),buf.length());
            this->rawSendFile(_404_PAGE_PATH.c_str(),session);
        }
    }
    else
    {
        this->responseFile(path,session);
    }
}

bool mainWorkCore::isReadableFile(std::string path) {
    if(access(path.c_str(),R_OK)<0)
    {
        return false;
    }
    struct stat s_buf;

    stat(path.c_str(),&s_buf);

    if(S_ISDIR(s_buf.st_mode))
    {
        return false;
    }
    else
    {
        return true;
    }
}


SessionData::SessionData():
        chunckedSendingFile(-1),
        rawSendingFile(-1)
{

}

SessionData::~SessionData()
{
    if(this->chunckedSendingFile!=-1)
    {
        close(chunckedSendingFile);
    }
    if(this->rawSendingFile != -1)
    {
        close(rawSendingFile);
    }
}

bool SessionData::busy()
{
    return this->rawSendingFile != -1||
           this->chunckedSendingFile!=-1;
}
