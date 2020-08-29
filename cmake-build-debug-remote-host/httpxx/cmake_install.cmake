# Install script for directory: /tmp/tmp.AvUSYOYUzD/httpxx

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/httpxx/http-parser" TYPE FILE FILES "/tmp/tmp.AvUSYOYUzD/httpxx/http-parser/http_parser.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/tmp/tmp.AvUSYOYUzD/cmake-build-debug-remote-host/httpxx/libhttpxx.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/httpxx" TYPE FILE FILES
    "/tmp/tmp.AvUSYOYUzD/httpxx/BufferedMessage.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/UserBufferedMessage.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Error.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Flags.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/icompare.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Message.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/MessageBuilder.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Method.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Request.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/RequestBuilder.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Response.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/ResponseBuilder.hpp"
    "/tmp/tmp.AvUSYOYUzD/httpxx/Url.hpp"
    )
endif()
