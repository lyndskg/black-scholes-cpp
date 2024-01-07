# Highest-level CMake run & build configuration file to specify project defaults
##########################################################################################################

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_compile_definitions($<$<CONFIG:DEBUG>:DEBUG>)

add_compile_options(
        # Don't omit frame pointers (e.g. for crash dumps)
        -fno-omit-frame-pointer
        # Enable exception handling
        -fexceptions
        # Enable warnings and warnings as errors
        -Wall
        -Wextra
        -Werror
        -Wconversion
        # Use -O2 (prioritize speed)
        $<$<CONFIG:RELEASE>:-O2>
        # Enable separate sections per function/data item
        $<$<CONFIG:RELEASE>:-ffunction-sections>
        $<$<CONFIG:RELEASE>:-fdata-sections>
)
