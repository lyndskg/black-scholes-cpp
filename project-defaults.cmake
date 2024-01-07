# Highest-level CMake run & build configuration file to specify project defaults
##########################################################################################################

# Set C++ standard to 20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set default visibility for C++ symbols to `hidden` -- i.e. they are not visible to other shared
# libraries or executables that link against the library.
## Often used when building shared libraries where internal details are kept secret and only a specific 
## API is user-presented/-deployed.
set(CMAKE_CXX_VISIBILITY_PRESET hidden)

# Enable generation of position-independent code.
## Necessary when building shared libraries to ensure that the code can be loaded into memory at runtime
## without conflicting with other libraries.
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Add preprocessor definitions to the compilation of source files.
## Typically used to control conditional compilation in the source code.
### $<$<CONFIG:DEBUG>:DEBUG> is a generator expression used to conditionally add the preprocessor definition.
#### The expression <CONFIG:DEBUG> checks if the current build configuration is set to "DEBUG."
#### If the condition is true, it adds the definition DEBUG to the compilation.
add_compile_definitions($<$<CONFIG:DEBUG>:DEBUG>) 

# Add additional compile-time flags and/or settings
add_compile_options(
        # Don't omit frame pointers (e.g. for crash dumps)
        -fno-omit-frame-pointer
        
        # Enable exception handling
        -fexceptions
        
        # Enable warnings and warnings as errors
        -Wall           # Activates a set of commonly used warning options that help catch potential issues
                        # or code that may lead to bugs. 
                        
        -Wextra         # Enables additional warning messages beyond those enabled by -Wall.
                        ## It helps catch additional issues and is often used for more comprehensive static 
                        ## code analysis.
        -Werror         # Treats all warning messages as errors, halting the compilation if any warnings 
                        # are generated.
                        
        -Wconversion    # Warns about implicit type conversions that may lose data.
        
        # Use -O2 (prioritize speed)
        ## The compiler flag -O2 enables level 2 optimization if the build configuration is set to
        ## RELEASE; otherwise, it is not included.
        $<$<CONFIG:RELEASE>:-O2> 


        # Enable separate sections per function/data item
        $<$<CONFIG:RELEASE>:-ffunction-sections>
        $<$<CONFIG:RELEASE>:-fdata-sections>
)
