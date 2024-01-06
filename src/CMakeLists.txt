cmake_minimum_required(VERSION 3.26)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add the include directories for Google Test
include_directories(${GTEST_INCLUDE_DIRS})

# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Add the source files for the library
add_library(blackScholesLibrary ${SOURCES})

# Add include directories for the library
target_include_directories(blackScholesLibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Set compiler features
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

# Link against Threads library (if needed)
target_link_libraries(blackScholesLibrary PRIVATE Threads::Threads)

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
