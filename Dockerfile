FROM ubuntu:22.04

RUN apt update
RUN apt-get install -y g++ python3 libopenblas-dev pip vim git tree
RUN apt-get install -y libgtest-dev
RUN apt-get install -y python3.10-venv

RUN pip install setuptools
RUN pip install pybind11
RUN pip install build
RUN pip install numpy
RUN pip install scikit-learn

RUN git clone https://github.com/Eriabinin777/MLOps_HW1.git
WORKDIR /MLOps_HW1
