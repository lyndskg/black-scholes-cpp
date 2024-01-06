# CMakeLists.txt for the test directory

set(GTEST_ROOT gtest)

# Find and include Google Test
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Add a test executable
add_executable(black_scholes_cpp_test
        test_blackScholesModel.cpp
        test_Program.cpp
        test_inputReader.cpp
        test_outputWriter.cpp
        test_optionGreeks.cpp
        test_optionGreeksModel.cpp
        gtest_main.cpp
)

# Link the test executable with the project library, Google Test, and other dependencies
target_link_libraries(black_scholes_cpp_test
        PRIVATE
        blackScholesLibrary
        curl
        GTest::GTest
        GTest::Main
)

# Specify the directories with header files
target_include_directories(black_scholes_cpp_test
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../src
        ${GTEST_INCLUDE_DIRS}
)

# Set up Google Test
enable_testing()

# Add a test to the CTest framework
add_test(NAME black_scholes_cpp_test COMMAND black_scholes_cpp_test)

