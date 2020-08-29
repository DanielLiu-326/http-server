cmake_minimum_required(VERSION 3.10)
project(EngineD)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -pthread)

add_subdirectory(config_parser)
add_subdirectory(httpxx)

add_executable(EngineD main.cpp MemoryPool.h RawList.h Worker.h Worker.cpp FifoBuffer.h WorkGroup.h mainWorkCore.h configs.h configs.cpp Server.cpp Server.h mainWorkCore.cpp)
target_link_libraries(EngineD httpxx config_parser)
