# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2.1\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2.1\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\aptx4\Desktop\MemoryPool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

# Include any dependencies generated for this target.
include httpxx\CMakeFiles\httpxx.dir\depend.make

# Include the progress variables for this target.
include httpxx\CMakeFiles\httpxx.dir\progress.make

# Include the compile flags for this target's objects.
include httpxx\CMakeFiles\httpxx.dir\flags.make

httpxx\CMakeFiles\httpxx.dir\Error.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Error.cpp.obj: ..\httpxx\Error.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Error.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Error.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Error.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Error.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Error.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Error.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Error.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Error.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Error.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Error.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Error.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Flags.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Flags.cpp.obj: ..\httpxx\Flags.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Flags.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Flags.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Flags.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Flags.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Flags.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Flags.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Flags.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Flags.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Flags.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Flags.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Flags.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\icompare.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\icompare.cpp.obj: ..\httpxx\icompare.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object httpxx/CMakeFiles/httpxx.dir/icompare.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\icompare.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\icompare.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\icompare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/icompare.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\icompare.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\icompare.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\icompare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/icompare.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\icompare.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\icompare.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Message.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Message.cpp.obj: ..\httpxx\Message.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Message.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Message.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Message.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Message.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Message.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Message.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Message.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Message.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Message.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Message.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Message.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\MessageBuilder.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\MessageBuilder.cpp.obj: ..\httpxx\MessageBuilder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object httpxx/CMakeFiles/httpxx.dir/MessageBuilder.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\MessageBuilder.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\MessageBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\MessageBuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/MessageBuilder.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\MessageBuilder.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\MessageBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\MessageBuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/MessageBuilder.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\MessageBuilder.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\MessageBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Method.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Method.cpp.obj: ..\httpxx\Method.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Method.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Method.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Method.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Method.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Method.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Method.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Method.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Method.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Method.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Method.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Method.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Request.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Request.cpp.obj: ..\httpxx\Request.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Request.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Request.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Request.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Request.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Request.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Request.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Request.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Request.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Request.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Request.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Request.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\RequestBuilder.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\RequestBuilder.cpp.obj: ..\httpxx\RequestBuilder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object httpxx/CMakeFiles/httpxx.dir/RequestBuilder.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\RequestBuilder.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\RequestBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\RequestBuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/RequestBuilder.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\RequestBuilder.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\RequestBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\RequestBuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/RequestBuilder.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\RequestBuilder.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\RequestBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Response.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Response.cpp.obj: ..\httpxx\Response.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Response.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Response.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Response.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Response.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Response.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Response.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Response.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Response.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Response.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Response.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Response.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\ResponseBuilder.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\ResponseBuilder.cpp.obj: ..\httpxx\ResponseBuilder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object httpxx/CMakeFiles/httpxx.dir/ResponseBuilder.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\ResponseBuilder.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\ResponseBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\ResponseBuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/ResponseBuilder.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\ResponseBuilder.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\ResponseBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\ResponseBuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/ResponseBuilder.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\ResponseBuilder.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\ResponseBuilder.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Url.cpp.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\Url.cpp.obj: ..\httpxx\Url.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object httpxx/CMakeFiles/httpxx.dir/Url.cpp.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\Url.cpp.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Url.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Url.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/Url.cpp.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\Url.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\Url.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\Url.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/Url.cpp.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\Url.cpp.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\Url.cpp
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\http-parser\http_parser.c.obj: httpxx\CMakeFiles\httpxx.dir\flags.make
httpxx\CMakeFiles\httpxx.dir\http-parser\http_parser.c.obj: ..\httpxx\http-parser\http_parser.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object httpxx/CMakeFiles/httpxx.dir/http-parser/http_parser.c.obj"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\httpxx.dir\http-parser\http_parser.c.obj /FdCMakeFiles\httpxx.dir\httpxx.pdb /FS -c C:\Users\aptx4\Desktop\MemoryPool\httpxx\http-parser\http_parser.c
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\http-parser\http_parser.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpxx.dir/http-parser/http_parser.c.i"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe > CMakeFiles\httpxx.dir\http-parser\http_parser.c.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\aptx4\Desktop\MemoryPool\httpxx\http-parser\http_parser.c
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

httpxx\CMakeFiles\httpxx.dir\http-parser\http_parser.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpxx.dir/http-parser/http_parser.c.s"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\httpxx.dir\http-parser\http_parser.c.s /c C:\Users\aptx4\Desktop\MemoryPool\httpxx\http-parser\http_parser.c
<<
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

# Object files for target httpxx
httpxx_OBJECTS = \
"CMakeFiles\httpxx.dir\Error.cpp.obj" \
"CMakeFiles\httpxx.dir\Flags.cpp.obj" \
"CMakeFiles\httpxx.dir\icompare.cpp.obj" \
"CMakeFiles\httpxx.dir\Message.cpp.obj" \
"CMakeFiles\httpxx.dir\MessageBuilder.cpp.obj" \
"CMakeFiles\httpxx.dir\Method.cpp.obj" \
"CMakeFiles\httpxx.dir\Request.cpp.obj" \
"CMakeFiles\httpxx.dir\RequestBuilder.cpp.obj" \
"CMakeFiles\httpxx.dir\Response.cpp.obj" \
"CMakeFiles\httpxx.dir\ResponseBuilder.cpp.obj" \
"CMakeFiles\httpxx.dir\Url.cpp.obj" \
"CMakeFiles\httpxx.dir\http-parser\http_parser.c.obj"

# External object files for target httpxx
httpxx_EXTERNAL_OBJECTS =

httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Error.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Flags.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\icompare.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Message.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\MessageBuilder.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Method.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Request.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\RequestBuilder.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Response.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\ResponseBuilder.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\Url.cpp.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\http-parser\http_parser.c.obj
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\build.make
httpxx\httpxx.lib: httpxx\CMakeFiles\httpxx.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX static library httpxx.lib"
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	$(CMAKE_COMMAND) -P CMakeFiles\httpxx.dir\cmake_clean_target.cmake
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1425~1.286\bin\Hostx86\x86\link.exe /lib /nologo /machine:X86 /out:httpxx.lib @CMakeFiles\httpxx.dir\objects1.rsp 
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug

# Rule to build all files generated by this target.
httpxx\CMakeFiles\httpxx.dir\build: httpxx\httpxx.lib

.PHONY : httpxx\CMakeFiles\httpxx.dir\build

httpxx\CMakeFiles\httpxx.dir\clean:
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx
	$(CMAKE_COMMAND) -P CMakeFiles\httpxx.dir\cmake_clean.cmake
	cd C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug
.PHONY : httpxx\CMakeFiles\httpxx.dir\clean

httpxx\CMakeFiles\httpxx.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\aptx4\Desktop\MemoryPool C:\Users\aptx4\Desktop\MemoryPool\httpxx C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx C:\Users\aptx4\Desktop\MemoryPool\cmake-build-debug\httpxx\CMakeFiles\httpxx.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : httpxx\CMakeFiles\httpxx.dir\depend

