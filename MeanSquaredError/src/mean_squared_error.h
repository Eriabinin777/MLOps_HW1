#pragma once

#include <vector>

class MeanSquaredError {
public:
  static double MSE(const std::vector<double> &a,
                    const std::vector<double> &b);
};
