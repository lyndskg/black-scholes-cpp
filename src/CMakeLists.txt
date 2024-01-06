# CMakeLists.txt for the src directory

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.27)

# Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
cmake_policy(SET CMP0144 OLD)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add the include directories for Google Test
include_directories(${GTEST_INCLUDE_DIRS})

# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Add the include directories for the main application
include_directories(src)

# Add your main application files
add_executable(bsm main.cpp)

# Link against your library and Google Test
target_link_libraries(bsm PRIVATE GTest::GTest GTest::Main blackScholesLibrary)

# Include directories for the main application
target_include_directories(bsm PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/black-scholes-cpp)

# Link against the Threads library (if needed)
target_link_libraries(bsm PRIVATE Threads::Threads)
