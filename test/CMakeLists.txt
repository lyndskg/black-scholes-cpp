# CMakeLists.txt for the test directory

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.26)

set(GTEST_ROOT gtest)

# Find and include Google Test
find_package(GTest REQUIRED)

if(NOT GTest_FOUND)
    message(FATAL_ERROR "Google Test not found. Please make sure it is installed.")
endif()

# Add a test executable
add_executable(black_scholes_cpp_test
        test/test_blackScholesModel.cpp
        test/test_Program.cpp
        test/test_inputReader.cpp
        test/test_outputWriter.cpp
        test/test_optionGreeks.cpp
        test/test_optionGreeksModel.cpp
        test/test_hestonModel.cpp
        test/gtest_main.cpp
)

# Include directories for the test executable
target_include_directories(black_scholes_cpp_test PRIVATE ${GTEST_INCLUDE_DIRS})

# Link against Google Test, blackScholesLibrary, and other necessary libraries
target_link_libraries(black_scholes_cpp_test
        PRIVATE
        GTest::GTest
        GTest::Main
        blackScholesLibrary
        curl
)

# Add support for threading
find_package(Threads REQUIRED)
target_link_libraries(black_scholes_cpp_test PRIVATE Threads::Threads)

# Set up Google Test
enable_testing()

# Add a test to the CTest framework
add_test(NAME black_scholes_cpp_test COMMAND black_scholes_cpp_test)

