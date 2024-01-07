# CMake custom target to clean up the project and its working build directory
## cmake/cleanup.cmake

# Clean build artifacts

# Remove CMake-generated build directory contents
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/CMakeFiles")
file(REMOVE "${CMAKE_BINARY_DIR}/Makefile")

# Remove additional build artifacts and directories
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/src")
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/test")
file(REMOVE "${CMAKE_BINARY_DIR}/black_scholes_cpp")


# Clean compiled object files and libraries

# Gather a list of generated object files and libraries
file(GLOB_RECURSE cmake_generated_files "${CMAKE_BINARY_DIR}/*.o" "${CMAKE_BINARY_DIR}/*.a")

# Iterate through the list and remove each file
foreach(file ${cmake_generated_files})
    file(REMOVE "${file}")
endforeach()


# Clean compiled executables

# Gather a list of generated executables
file(GLOB cmake_executables "${CMAKE_BINARY_DIR}/*")

# Iterate through the list and remove each file or directory
foreach(file ${cmake_executables})
    # If the current item in the list is a directory and not the 'cmake' directory,
    if(IS_DIRECTORY "${file}" AND NOT "${file}" STREQUAL "${CMAKE_BINARY_DIR}/cmake")
        ## recursively remove the directory and its contents.
        file(REMOVE_RECURSE "${file}")
    # Else if the current item is not a directory and not the 'CMake' directory,
    elseif(NOT "${file}" STREQUAL "${CMAKE_BINARY_DIR}/cmake")
        ## remove the individual file.
        file(REMOVE "${file}")
    endif()
endforeach()


# Clean CTest artifacts

# Remove CTest-generated testing artifacts
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/Testing")

# Display successful cleanup message
message(STATUS "Build artifacts cleaned.")
