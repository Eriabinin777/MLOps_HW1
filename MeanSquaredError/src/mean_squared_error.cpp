#include "mean_squared_error.h"

#include <iostream>
#include <vector>

double MeanSquaredError::MSE(const std::vector<double> &a,
                                 const std::vector<double> &b) {
  if (a.size() != b.size()) {
    throw std::runtime_error("Vectors must be of the same size");
  }

  double sum = 0;
  for (int i = 0; i < a.size(); ++i) {
    double r = a[i] - b[i]
    sum += r * r;
  }
  return sum / a.size();
}

