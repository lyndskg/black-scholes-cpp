# cmake/clean.cmake

# Clean build artifacts
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/CMakeFiles")
file(REMOVE "${CMAKE_BINARY_DIR}/Makefile")
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/src")
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/test")
file(REMOVE "${CMAKE_BINARY_DIR}/black_scholes_cpp")

# Clean compiled object files and libraries
file(GLOB_RECURSE cmake_generated_files "${CMAKE_BINARY_DIR}/*.o" "${CMAKE_BINARY_DIR}/*.a")
foreach(file ${cmake_generated_files})
    file(REMOVE "${file}")
endforeach()

# Clean compiled executables
file(GLOB cmake_executables "${CMAKE_BINARY_DIR}/*")
foreach(file ${cmake_executables})
    if(IS_DIRECTORY "${file}" AND NOT "${file}" STREQUAL "${CMAKE_BINARY_DIR}/cmake")
        file(REMOVE_RECURSE "${file}")
    elseif(NOT "${file}" STREQUAL "${CMAKE_BINARY_DIR}/cmake")
        file(REMOVE "${file}")
    endif()
endforeach()

# Clean CTest artifacts
file(REMOVE_RECURSE "${CMAKE_BINARY_DIR}/Testing")

message(STATUS "Build artifacts cleaned.")
