# tests/CMakeLists.txt

# Collect test source files
file(GLOB TEST_SOURCES "*.cpp")

# Add the test executable
add_executable(run_tests ${TEST_SOURCES})

# Link libraries if necessary (e.g., libcurl, OneMKL)
target_link_libraries(run_tests gtest gtest_main blackScholesLibrary)

# Set up Google Test for the main test executable
enable_testing()
add_test(run_tests run_tests)
