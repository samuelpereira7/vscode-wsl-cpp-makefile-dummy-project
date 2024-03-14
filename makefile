# Compiler options
CXX = g++ -g -Wall
CXXFLAGS = -std=c++11 -g

# Source files
SRCS = $(wildcard *.cpp)
LIB_SRCS = $(wildcard lib/*.cpp)

# Object files
OBJS = $(SRCS:.cpp=.o)
LIB_OBJS = $(LIB_SRCS:.cpp=.o)

# Output directory and filename
OUTPUT_DIR = build
OUTPUT_FILE = output.bin

all: $(OUTPUT_DIR)/$(OUTPUT_FILE)

$(OUTPUT_DIR)/$(OUTPUT_FILE): $(OBJS) $(LIB_OBJS)
	@mkdir -p $(OUTPUT_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Compile main.cpp
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile library files
lib/%.o: lib/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OUTPUT_DIR) $(OBJS) $(LIB_OBJS)

.PHONY: all clean
