# src/CMakeLists.txt

# Collect source files
file(GLOB SOURCES "*.cpp")

# Add the source files to the library
add_library(blackScholesLibrary ${SOURCES})

# Include directories
target_include_directories(blackScholesLibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
