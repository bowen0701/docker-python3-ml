# Ref1: https://store.docker.com/community/images/tensorflow/tensorflow
# Ref2: https://store.docker.com/community/images/dash00/tensorflow-python3-jupyter

FROM ubuntu:16.04

LABEL maintainer="Bowen Li <bowen0701@gmail.com>"

# Pick up some TensorFlow dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        # python \
        # python-dev \
        # python-pip \
        # python-setuptools \
        python3 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        sklearn \
        pandas \
        Pillow \
        && \
    python3 -m ipykernel.kernelspec

RUN pip3 --no-cache-dir install --upgrade \
        tensorflow


