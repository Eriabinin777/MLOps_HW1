from setuptools import setup, find_packages
from glob import glob

so_files = glob("MeanSquaredError/python/mse_core*.so")

setup(
    name="MeanSquaredError",
    version="0.1",
    description="Mean Squared Error utility with Python bindings",
    packages=find_packages(),
    package_data={
        "MeanSquaredError": ["python/*.so"],
    },
)
