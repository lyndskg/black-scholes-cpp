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

# Add the main executable
add_executable(black_scholes_cpp src/main.cpp)

# Add include directories
include_directories(black_scholes_cpp PRIVATE include/black-scholes-cpp)
include_directories(black_scholes_cpp PRIVATE include/third_party)

# Unit tests
add_executable(bs
        src/blackScholesModel.cpp
        src/Program.cpp
        src/inputReader.cpp
        src/outputWriter.cpp
        src/optionGreeks.cpp
        src/optionGreeksModel.cpp
        src/hestonModel.cpp)



# Include the 'docs' directory (for completeness, you may want to generate documentation using tools like Doxygen)
include_directories(docs)

# Add the path to the fast_io source files
include_directories(include/third_party/fast_io)

# Add the fast_io source files to your project
set(FAST_IO_SOURCES
        path/to/fast_io/source/file1.cpp
        path/to/fast_io/source/file2.cpp
        # Add more files if needed
)

# Link libraries if necessary (e.g., libcurl, OneMKL)
target_link_libraries(black_scholes_cpp curl blackScholesLibrary gtest_main)
# target_link_libraries(oneMKL)

# Set your compiler flags
target_compile_options(black_scholes_cpp PRIVATE -std=gnu++20 -g)

# Add your other targets and configurations...

# Custom target for cleaning
add_custom_target(cleanup
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}
        COMMENT "Cleaning up..."
)

# Specify the location of your header files
target_include_directories(black_scholes_cpp PRIVATE include/black-scholes-cpp)


target_link_libraries(bs gtest_main)
add_test(NAME bs_test COMMAND bs)
