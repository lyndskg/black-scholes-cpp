# Top-level CMakeLists.txt
##########################################################################################################

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

set(CMAKE_VERBOSE_MAKEFILE on)

# Project configuration
project(black-scholes-cpp VERSION 1.0 LANGUAGES CXX)


# General
##########################################################################################################

## Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
#cmake_policy(SET CMP0146 OLD)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

set(CMAKE_OSX_DEPLOYMENT_TARGET "13.5" CACHE STRING "Minimum macOS version")

message(STATUS "C++ Compiler Flags: ${CMAKE_CXX_FLAGS}")

# Set C++ standard to 20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include default project specifications
include (project-defaults.cmake)


# Google Test & Mocking
##########################################################################################################

## Set GTest root directory
# set(GTEST_ROOT "/opt/homebrew/Cellar/googletest/1.14.0" CACHE PATH "Google Test root directory")

## Locate the Google Test library
# find_package(GTest REQUIRED)

# if(NOT GTest_FOUND)
#    message(FATAL_ERROR "Google Test not found. Please make sure it is installed.")
# endif()


# Main program executable
##########################################################################################################

# Add subdirectories
add_subdirectory(gtest)  # Assuming Google Test is in the 'gtest' directory
add_subdirectory(src)
add_subdirectory(test)

# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Add the main executable
set(EXECUTABLE_NAME "black_scholes")
add_executable(black_scholes src/main.cpp)

# Executable dependencies
if(SOURCES)
    add_executable("${EXECUTABLE_NAME}" ${SOURCES})
endif(SOURCES)

# Add include directories
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(black_scholes PRIVATE include/black-scholes-cpp)
include_directories(black_scholes PRIVATE include/third_party)


# Instantiate and define Black-Scholes library
##########################################################################################################

# Add the source files for the library
add_library(blackScholesLibrary
        ${SOURCES}
        test/gtest_main.cpp
        test/test_blackScholesModel.cpp
)

# Add include directories for the library
target_include_directories(blackScholesLibrary
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        # Add other include directories as needed
)

# Set compiler features
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

## Link against Threads library (if needed)
#target_link_libraries(blackScholesLibrary PRIVATE Threads::Threads)

# Include directories for the library
target_include_directories(blackScholesLibrary
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        # Add other include directories as needed
)

# Set compiler features
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

# Link against Google Test, blackScholesLibrary, Threads, and other necessary libraries
target_link_libraries(black_scholes
        PRIVATE
        GTest::gtest_main
        blackScholesLibrary
        curl
)

# Testing configurations
##########################################################################################################


# Optionally, enable CTest for running tests with 'make test'
enable_testing()

include(GoogleTest)
include(CTest)

gtest_discover_tests(black_scholes)

# Add each test
add_test(NAME black_scholes_test COMMAND black_scholes)


# Custom targets
##########################################################################################################

# Cleaning up the project and build directory
add_custom_target(cleanup
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/cleanup.cmake
        COMMENT "Cleaning build artifacts"
)