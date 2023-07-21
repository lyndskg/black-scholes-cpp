NAME := blackscholes

# Specify the C++ compiler
CXX = g++

# Compiler flags
CXXFLAGS = -std=c++20 -Wconversion -Wall -Werror -Wextra -pedantic -g -I/opt/homebrew/opt/curl/include

# Update compiler flags to include paths for oneMKL headers
CXXFLAGS += -I/opt/intel/oneapi/mkl/2023.2.0/include

# Linker flags and libraries
LDFLAGS = -L/opt/homebrew/opt/curl/lib

# Update library paths and linking flags to ensure that the linker can find the oneMKL library files
LDFLAGS += -L/opt/intel/oneapi/mkl2023.2.0/lib -WI, -rpath -lmkl_intel_ilp64 -lmkl_tbb_thread -lmkl_core -lpthread -lm -ldl

LIBS = -lcurl

# Define the source files used in the project
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)

# Specify the target executable
EXE = bs

# Default rule to build the executable
$(EXE): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@ $(LIBS)

# Rule to compile C++ source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean rule to remove object files and the executable
clean:
	rm -f $(OBJS) $(EXE)
