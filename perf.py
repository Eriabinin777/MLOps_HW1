import time
from typing import Callable

import numpy as np
import scikit-learn
from sklearn.metrics import mean_squared_error

import MeanSquaredError as mse

def test_timings(func: Callable, *args):
    _ = func(*args)
    start_time = time.time()
    _ = func(*args)
    end_time = time.time()
    return round(end_time - start_time, 5)


if __name__ == "__main__":
    for l in [5, 10, 50, 100, 500, 1000, 5000]:
        a = np.random.rand(l)
        b = np.random.rand(l)
        print("Mean Squared Error (Pure C++), size={0}: {1} seconds".format(l, test_timings(mse.MeanSquaredError.MSE, a, b)))
        print("Mean Squared Error (Python sklearn), size={0}: {1} seconds\n".format(l, test_timings(mean_squared_error, a, b)))
