# Top-level CMakeLists.txt

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

# Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
cmake_policy(SET CMP0144 OLD)

# Project configuration
project(black-scholes-cpp VERSION 1.0 LANGUAGES CXX)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=x86-64")

message(STATUS "C++ Compiler Flags: ${CMAKE_CXX_FLAGS}")

# Set C++ standard to 20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Locate the Google Test library
find_package(GTest REQUIRED)

if(NOT GTest_FOUND)
    message(FATAL_ERROR "Google Test not found. Please make sure it is installed.")
endif()

# Add subdirectories
add_subdirectory(gtest)  # Assuming Google Test is in the 'gtest' directory
add_subdirectory(src)
add_subdirectory(test)

# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Add the source files for the library
add_library(blackScholesLibrary ${SOURCES})

# Add include directories for the library
target_include_directories(blackScholesLibrary
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        # Add other include directories as needed
)

# Set compiler features
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

# Link against Threads library (if needed)
target_link_libraries(blackScholesLibrary PRIVATE Threads::Threads)

# Add the main executable
add_executable(black_scholes_cpp ${SOURCES})

# Add include directories
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(black_scholes_cpp PRIVATE include/black-scholes-cpp)
include_directories(black_scholes_cpp PRIVATE include/third_party)

# Include directories for the library
target_include_directories(blackScholesLibrary
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        # Add other include directories as needed
)

# Set compiler features
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

# Link against Google Test, blackScholesLibrary, Threads, and other necessary libraries
target_link_libraries(black_scholes_cpp
        PRIVATE
        GTest::GTest
        GTest::Main
        blackScholesLibrary
        curl
        Threads::Threads
)

# Optionally, enable CTest for running tests with 'make test'
enable_testing()
include(GoogleTest)

gtest_discover_tests(black_scholes_cpp)

add_test(NAME black_scholes_cpp_test COMMAND black_scholes_cpp)

# Custom target for cleaning
add_custom_target(cleanup
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/cleanup.cmake
        COMMENT "Cleaning build artifacts"
)