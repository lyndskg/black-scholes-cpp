# CMakeLists.txt for the test directory

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.27)

# Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
cmake_policy(SET CMP0144 OLD)

set(CMAKE_VERBOSE_MAKEFILE on)

## Set GTest root directory
#set(GTEST_ROOT "/opt/homebrew/Cellar/googletest/1.14.0" CACHE PATH "Google Test root directory")

# assume built-in pthreads on MacOS
if(APPLE)
    set(CMAKE_THREAD_LIBS_INIT "-lpthread")
    set(CMAKE_HAVE_THREADS_LIBRARY 1)
    set(CMAKE_USE_WIN32_THREADS_INIT 0)
    set(CMAKE_USE_PTHREADS_INIT 1)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
endif()

include(FetchContent)
include(GoogleTest)

# Fetch GTest
FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
FetchContent_MakeAvailable(googletest)

## Find and include Google Test
#find_package(GTest REQUIRED)
#
#if(NOT GTest_FOUND)
#    message(FATAL_ERROR "Google Test not found. Please make sure it is installed.")
#endif()

# Add a test executable
add_executable(black_scholes_cpp_test
        test_blackScholesModel.cpp
        test_Program.cpp
        test_inputReader.cpp
        test_outputWriter.cpp
        test_optionGreeks.cpp
        test_optionGreeksModel.cpp
        test_hestonModel.cpp
        gtest_main.cpp
)

# Include directories for the test executable
target_include_directories(black_scholes_cpp_test PRIVATE ${GTEST_INCLUDE_DIRS})

# Link against Google Test, blackScholesLibrary, and other necessary libraries
target_link_libraries(black_scholes_cpp_test
        PRIVATE
        GTest::gtest_main
        blackScholesLibrary
        curl
)

# Add support for threading
find_package(Threads REQUIRED)
target_link_libraries(black_scholes_cpp_test PRIVATE Threads::Threads)

# Set up Google Test
enable_testing()

# Add a test to the CTest framework
add_test(NAME black_scholes_cpp_test COMMAND black_scholes_cpp_test)

