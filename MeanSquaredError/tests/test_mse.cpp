#include "mean_squared_error.h"
#include <gtest/gtest.h>

TEST(MeanSquaredErrorTests, MeanSquaredError) {
  std::vector<double> a = {1.0, 2.0, 3.0, 4.0};
  std::vector<double> b = {5.0, 6.0, 7.0, 8.0};
  EXPECT_DOUBLE_EQ(16.0, MeanSquaredError::MSE(a, b));
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
