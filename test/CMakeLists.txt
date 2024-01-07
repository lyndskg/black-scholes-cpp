# CMakeLists.txt for the test directory
##########################################################################################################

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

# Include POSIX threads as a compiler flag to enable threading
SET(CMAKE_CXX_FLAGS -pthread)


# Assume built-in pthreads on MacOS
## Check if the current platform is macOS (Apple)
if(APPLE)
    ### Set the thread library initialization flag to use "-lpthread"
    set(CMAKE_THREAD_LIBS_INIT "-lpthread")

    ### Indicate that the platform has a threads library
    set(CMAKE_HAVE_THREADS_LIBRARY 1)

    ### Disable the use of Win32 threads
    set(CMAKE_USE_WIN32_THREADS_INIT 0)

    ### Enable the use of pthreads
    set(CMAKE_USE_PTHREADS_INIT 1)

    ### Prefer the pthread flag when compiling
    set(THREADS_PREFER_PTHREAD_FLAG ON)
endif()


set(BSM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

# Include default project specifications
include (${BSM_ROOT}/project-defaults.cmake)

##########################################################################################################

# Fetch Google Test using FetchContent

## Include the FetchContent module, which provides functions for downloading and building  
## external perojects
include(FetchContent)

## Include the GoogleTest module, which provides functions related to Google Test integration
include(GoogleTest)

## Declare the external project 'googletest' using FetchContent_Declare
FetchContent_Declare(
        googletest        # Name of the content to be fetched (i.e. Google Test)
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)

# Make the content (Google Test) available in the build system
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

