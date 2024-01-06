cmake_minimum_required(VERSION 3.26)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(GTEST_ROOT gtest)

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add the include directories for Google Test
include_directories(${GTEST_INCLUDE_DIRS})

# Collect source files
file(GLOB SOURCES "*.cpp")

# Add the source files to the library
#add_library(blackScholesLibrary ${SOURCES})

# Include directories
target_include_directories(blackScholesLibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

project(bsm)

# Add the include directories for the main application
include_directories(src)

# Add your main application files
add_executable(bsm main.cpp)

# Link against your library and Google Test
target_link_libraries(bsm PRIVATE GTest::GTest GTest::Main blackScholesLibrary)
