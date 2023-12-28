# gtest/CMakeLists.txt

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add your gtest files
# Specify the list of source files for your Google Test executable.
set(TEST_SOURCES
        test_blackScholesModel.cpp
        test_Program.cpp
        test_inputReader.cpp
        test_outputWriter.cpp
        test_optionGreeks.cpp
        test_optionGreeksModel.cpp
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

# Optionally, enable CTest for running tests with 'make test'
# Include the GoogleTest module for integration with CTest.
include(GoogleTest)

# Discover tests using Google Test.
gtest_discover_tests(run_tests_gtest)
