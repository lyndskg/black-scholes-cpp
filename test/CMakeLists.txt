# test/CMakeLists.txt

# Locate the Google Test library
find_package(GTest REQUIRED)

# Add your test files
set(TEST_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/test_blackScholesModel.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/test_Program.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/test_inputReader.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/test_outputWriter.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/test_optionGreeks.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/test_optionGreeksModel.cpp
        gtest_main.cpp
        # Add more test files if needed
)

# Add the test executable
add_executable(run_tests ${TEST_SOURCES})

# Link the test executable against Google Test
target_link_libraries(run_tests GTest::GTest GTest::Main blackScholesLibrary)

# Set up Google Test
enable_testing()
add_test(run_tests run_tests)

include_directories(gtest)
include(GoogleTest)
gtest_discover_tests(run_tests run_tests)


add_executable(blackScholesModelTest ../test/test_blackScholesModel.cpp)

# Link the test executable against Google Test
target_link_libraries(blackScholesModelTest GTest::GTest GTest::Main blackScholesLibrary)

enable_testing()
add_test(blackScholesModelTest DefaultConstructor)

# Optionally, enable CTest for running tests with 'make test'
include_directories(gtest)
include(GoogleTest)
gtest_discover_tests(blackScholesModelTest DefaultConstructor)


