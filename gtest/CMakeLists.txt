# gtest/CMakeLists.txt

# Set GTest root directory
set(GTEST_ROOT "/opt/homebrew/Cellar/googletest/1.14.0" CACHE PATH "Google Test root directory")

# Locate the Google Test library
#find_package(GTest REQUIRED)

# Add your gtest files
# Specify the list of source files for your Google Test executable.
set(TEST_SOURCES
        ../test/test_blackScholesModel.cpp
        ../test/test_Program.cpp
        ../test/test_inputReader.cpp
        ../test/test_outputWriter.cpp
        ../test/test_optionGreeks.cpp
        ../test/test_optionGreeksModel.cpp
        ../test/gtest_main.cpp
        gtest.h
        # Add more test files if needed
)

# Add the gtest executable
# Create an executable named 'run_tests_gtest' using the specified test source files.
add_executable(run_tests_gtest ${TEST_SOURCES})

# Link the test executable against Google Test
# Specify the libraries to link against for the 'run_tests_gtest' executable.
target_link_libraries(run_tests_gtest PRIVATE gtest gtest_main)

# Set up Google Test
# Enable testing for the project.
enable_testing()

# Add a test with a name and the command to run the executable
# Define a test with the name 'run_tests_gtest' that runs the 'run_tests_gtest' executable.
add_test(NAME run_tests_gtest COMMAND run_tests_gtest)

add_executable(blackScholesModelTest ${TEST_SOURCES})

add_test(NAME blackScholesModelTest COMMAND DefaultConstructor)

# Optionally, enable CTest for running tests with 'make test'
# Include the GoogleTest module for integration with CTest.
include(GoogleTest)

# Discover tests using Google Test.
gtest_discover_tests(run_tests_gtest)
gtest_discover_tests(blackScholesModelTest)
