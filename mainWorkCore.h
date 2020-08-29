//
// Created by Danny on 2020/8/25.
//

#ifndef MEMORYPOOL_MAINWORKCORE_H
#define MEMORYPOOL_MAINWORKCORE_H

#include"configs.h"

#include<stdio.h>
#include<string>
#include<sstream>
#include<iostream>
#include"Worker.h"
#include"httpxx/http.hpp"
#include <sys/stat.h>



inline int file_size(const char* filename)
{
    struct stat statbuf;
    stat(filename,&statbuf);
    int size=statbuf.st_size;
    return size;
}
class mainWorkCore;
struct SessionData
{
    SessionData();
    ~SessionData();
    inline bool busy();
    http::BufferedRequest   reqBuffer;                 //request saving buffer;
    int                     chunckedSendingFile;       //the file which is sending by chunked encoding now
    int                     rawSendingFile;
};

class mainWorkCore: public WorkerCore {
public:
    mainWorkCore();
    ~mainWorkCore();
    //father override
    void onDataIN(char *data, int length, Session *session) override;
    void onSessionEstablish(Session *session) override;
    void onSessionClose(Session *session) override;
    void onWorkerInitErr() override;
    void onSessionSended(Session *session) override;
    //file response;
    void responseFileChunked(std::string path, Session *session);
    void responseFile(std::string path, Session *session);
    //TCP layer ssend
    inline void sendChunk(Session *session, const char *data, int dataLen);
    inline void rawSend(Session *session, const char *rawData, int length);
    //http Events;
    void onRequest(Session *session, http::BufferedRequest &request);
    void onConnectionClose(Session *session);
    //http method reply;
    void onHttpGet(Session *session, http::BufferedRequest &request);
private:
    void sendFileByChunks(std::string filePath, Session *session);
    void sendFileChunk(Session *session);   //continue send File in chunks
    inline int rawSendFile(const std::string &path, Session *session);
    void sendFilePart(Session *session);        //continue raw send file
    SessionData **sessionDatas;
    char *fileBuffer;
    static bool isReadableFile(std::string path);
};

#endif //MEMORYPOOL_MAINWORKCORE_H
