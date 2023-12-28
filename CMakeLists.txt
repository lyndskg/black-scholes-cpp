# Top-level CMakeLists.txt

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.14)

# Project configuration
project(black-scholes-cpp VERSION 1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Download and unpack Google Test at configure time
# (Your existing Google Test configuration)

# Add the gtest directory
add_subdirectory(gtest)

# Add subdirectories
add_subdirectory(src)
add_subdirectory(test)

# Add include directories
include_directories(include/black-scholes-cpp)
include_directories(include/third_party)

# Include the 'docs' directory (for completeness, you may want to generate documentation using tools like Doxygen)
include_directories(docs)

# Add the main executable
add_executable(black_scholes_cpp src/main.cpp)

# Link libraries if necessary (e.g., libcurl, OneMKL)
target_link_libraries(black_scholes_cpp curl OneMKL blackScholesLibrary gtest_main)

# Add your other targets and configurations...

# Unit tests
add_executable(bs
        src/blackScholesModel.cpp
        src/Program.cpp
        src/inputReader.cpp
        src/outputWriter.cpp
        src/optionGreeks.cpp
        src/optionGreeksModel.cpp
        src/hestonModel.cpp)

target_link_libraries(bs gtest_main)
add_test(NAME bs_test COMMAND bs)
