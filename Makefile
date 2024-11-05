CXX=g++
CXXFLAGS=-std=c++11 -O3 -march=native -Wall -I$(SRC_DIR) $(shell python3 -m pybind11 --includes)
PY_LDFLAGS=$(shell python3-config --ldflags) -shared -fPIC
GTEST_FLAGS=-lgtest -lgtest_main -pthread
LDFLAGS=-lopenblas
SRC_DIR=MeanSquaredError/src
TESTS_DIR=MeanSquaredError/tests
PYTHON_DIR=MeanSquaredError/python

all: MeanSquaredError test

MeanSquaredError: $(PYTHON_DIR)/bindings.o $(SRC_DIR)/mean_squared_error.o
	$(CXX) $^ -o $(PYTHON_DIR)/mse_core`python3-config --extension-suffix` $(PY_LDFLAGS) $(CXXFLAGS)

$(PYTHON_DIR)/bindings.o: $(PYTHON_DIR)/bindings.cpp $(SRC_DIR)/mean_squared_error.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(SRC_DIR)/mean_squared_error.o: $(SRC_DIR)/mean_squared_error.cpp $(SRC_DIR)/mean_squared_error.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

test: $(TESTS_DIR)/test_mse.o $(SRC_DIR)/mean_squared_error.o
	$(CXX) $^ -o $(TESTS_DIR)/test_mse $(GTEST_FLAGS) $(LDFLAGS)

$(TESTS_DIR)/test_mse.o: $(TESTS_DIR)/test_mse.cpp $(SRC_DIR)/mean_squared_error.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

run_tests: test
	./$(TESTS_DIR)/test_mse

clean:
	rm -f $(PYTHON_DIR)/*.o $(SRC_DIR)/*.o $(TESTS_DIR)/*.o $(PYTHON_DIR)/mse_core`python3-config --extension-suffix` $(TESTS_DIR)/test_mse
