CXX=g++
CXXFLAGS=-Wall -Werror -std=c++20 -g
INCLUDES=-Isrc

SRC_DIR=src
OBJ_DIR=obj
BIN_DIR=bin
TARGET=cide

SRC=$(wildcard $(SRC_DIR)/*.cpp)
OBJ=$(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

all: $(OBJ)
	@echo "Linking "$^
	@$(CXX) -o $(BIN_DIR)/$(TARGET) $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo "Compiling "$^
	@$(CXX) -o $@ -c $^ $(CXXFLAGS) $(INCLUDES)

clean:
	@rm -f $(OBJ) $(BIN_DIR)/$(TARGET)
	@echo "Removed "$(OBJ) $(BIN_DIR)/$(TARGET)