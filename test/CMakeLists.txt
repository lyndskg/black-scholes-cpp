# CMakeLists.txt for the test directory
##########################################################################################################

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

# Include POSIX threads as a compiler flag to enable threading
SET(CMAKE_CXX_FLAGS -pthread)

# Assume built-in pthreads on MacOS
if(APPLE)
    set(CMAKE_THREAD_LIBS_INIT "-lpthread")
    set(CMAKE_HAVE_THREADS_LIBRARY 1)
    set(CMAKE_USE_WIN32_THREADS_INIT 0)
    set(CMAKE_USE_PTHREADS_INIT 1)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
endif()

# Include default CMake project specifications
set(BSM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)
include (${BSM_ROOT}/project-defaults.cmake)

##########################################################################################################

# Fetch Google Test using FetchContent
include(FetchContent)
include(GoogleTest)

FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
FetchContent_MakeAvailable(googletest)


##########################################################################################################

# Add test source files
file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# Add a test executable
add_executable(bsm_test
        gtest_main.cpp
        ${SOURCES}
        test_blackScholesModel.cpp
        test_Program.cpp
        test_inputReader.cpp
        test_outputWriter.cpp
        test_optionGreeks.cpp
        test_optionGreeksModel.cpp
        test_hestonModel.cpp
)

# Include directories for the test executable
target_include_directories(bsm_test PRIVATE ${GTEST_INCLUDE_DIRS})

# Link against Google Test, blackScholesLibrary, and other necessary libraries
target_link_libraries(bsm_test
        PRIVATE
        GTest::gtest
        GTest::gtest_main
        blackScholesLibrary
        curl
)

# Add support for threading
find_package(Threads REQUIRED)
target_link_libraries(bsm_test PRIVATE Threads::Threads)


##########################################################################################################

# Set up Google Test and CTest
enable_testing()
include(CTest)

include_directories(${gtest_INCLUDE_DIRS})

# Discover tests using Google Test
gtest_discover_tests(bsm_test)

# Add a test to the CTest framework
add_test(NAME bsm_test COMMAND bsm_test)

