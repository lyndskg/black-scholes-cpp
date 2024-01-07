# CMakeLists.txt for the src directory
##########################################################################################################

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

## Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
#cmake_policy(SET CMP0144 OLD)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the root directory for the project
set(BSM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

# Include default project specifications
include (${BSM_ROOT}/project-defaults.cmake)


##########################################################################################################

# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Add the include directories for the main application
include_directories(src)
include_directories(include/black-scholes-cpp)

# Add the main application executable
add_executable(bsm main.cpp ${SOURCES})

# Link against the BSM library and Google Test
target_link_libraries(bsm PRIVATE blackScholesLibrary)

# Include directories for the main application
target_include_directories(bsm PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/black-scholes-cpp)

## Link against the Threads library (if needed)
#target_link_libraries(bsm PRIVATE Threads::Threads)
