#include "mean_squared_error.h"

#include <iostream>
#include <vector>

double MeanSquaredError::MSE(const std::vector<double> &a,
                             const std::vector<double> &b) {
  if (a.size() != b.size()) {
    throw std::runtime_error("Vectors must be of the same size");
  }

  double sum = 0;
  for (size_t i = 0; i < a.size(); ++i) {
    sum += (a[i] - b[i]) * (a[i] - b[i]);
  }
  return sum / a.size();
}

