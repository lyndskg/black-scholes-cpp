# Top-level CMakeLists.txt
##########################################################################################################

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

# Enable verbose output during the build process
set(CMAKE_VERBOSE_MAKEFILE on)

# Project configuration
project(black-scholes-cpp VERSION 1.0 LANGUAGES CXX)


# General
##########################################################################################################

## Set the policy for find_package to use upper-case <PACKAGENAME>_ROOT variables
#cmake_policy(SET CMP0146 OLD)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
message(STATUS "C++ Compiler Flags: ${CMAKE_CXX_FLAGS}")

# Set the minimum macOS deployment target
set(CMAKE_OSX_DEPLOYMENT_TARGET "13.5" CACHE STRING "Minimum macOS version")

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

# Optionally, enable CTest for running tests with 'make test'
enable_testing()


# Main program executable
##########################################################################################################

# Add subdirectories for project components
add_subdirectory(src)
add_subdirectory(test)

# Executable dependencies
# Collect source files
file(GLOB SOURCES "src/*.cpp" "include/black-scholes-cpp/*.h")

# Check if there are source files before creating the executable
if(SOURCES)
    # Create the main executable
    add_executable(black_scholes ${SOURCES})

    # Set include directories for the executable
    target_include_directories(black_scholes PRIVATE include/black-scholes-cpp)
    target_include_directories(black_scholes PRIVATE include/third_party)

    # Link the main executable against Google Test, the Black-Scholes library, and other necessary libraries
    target_link_libraries(black_scholes
            PRIVATE
            GTest::gtest
            GTest::gtest_main
            blackScholesLibrary
            curl
    )
endif()


# Instantiate and define the Black-Scholes library
##########################################################################################################

# Add the source files for the library
add_library(blackScholesLibrary
        src/blackScholesModel.cpp
        src/hestonModel.cpp
        src/inputReader.cpp
        src/optionGreeks.cpp
        src/optionGreeksModel.cpp
        src/outputWriter.cpp
        src/Program.cpp
        src/main.cpp
)

# Add include directories for the library
target_include_directories(blackScholesLibrary
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        # Add other include directories as needed
)

# Set compiler features for the library
target_compile_features(blackScholesLibrary PUBLIC cxx_std_20)

# Link against Google Test and other necessary libraries
target_link_libraries(blackScholesLibrary PRIVATE GTest::gtest GTest::gtest_main curl)


# Testing configurations
##########################################################################################################

include(GoogleTest)
include(CTest)

# Discover and run tests using Google Test
gtest_discover_tests(black_scholes)

# Add a test target
add_test(NAME black_scholes_test COMMAND black_scholes)


# Custom targets
##########################################################################################################

# Add a custom target for cleaning up the project and the build directory
add_custom_target(cleanup
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/cleanup.cmake
        COMMENT "Cleaning build artifacts"
)

# Create a custom target for each test file
# Testing blackScholesModel
add_custom_target(test_blackScholesModel
        COMMAND test_blackScholesModel
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for blackScholesModel"
)

# Testing hestonModel
add_custom_target(test_hestonModel
        COMMAND test_hestonModel
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for hestonModel"
)

# Testing inputReader
add_custom_target(test_inputReader
        COMMAND test_inputReader
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for inputReader"
)

# Testing optionGreeks
add_custom_target(test_optionGreeks
        COMMAND test_optionGreeks
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for optionGreeks"
)

# Testing optionGreeksModel
add_custom_target(test_optionGreeksModel
        COMMAND test_optionGreeksModel
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for optionGreeksModel"
)

# Testing outputWriter
add_custom_target(test_outputWriter
        COMMAND test_outputWriter
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for outputWriter"
)

# Testing Program
add_custom_target(test_Program
        COMMAND test_Program
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running tests for Program"
)

# Add a custom target for running all tests
add_custom_target(run_tests
        COMMAND ${CMAKE_CTEST_COMMAND} --verbose
        DEPENDS
            test_blackScholesModel
            test_hestonModel
            test_inputReader
            test_optionGreeks
            test_optionGreeksModel
            test_outputWriter
            test_Program
            # Add other test targets if needed
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Running all unit tests"
)