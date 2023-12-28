# gtest/CMakeLists.txt

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add the gtest executable
add_executable(run_tests_gtest your_gtest_files.cpp)

# Link the test executable against Google Test
target_link_libraries(run_tests_gtest GTest::GTest GTest::Main)

# Set up Google Test
enable_testing()
add_test(run_tests_gtest run_tests_gtest)
