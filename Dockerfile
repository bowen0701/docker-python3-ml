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
        numpy \
        scipy \
        pandas \
        sklearn \
        ipykernel \
        jupyter \
        matplotlib \
        seaborn \
        Cython \
        Pillow \
        requests \
        && \
    python3 -m ipykernel.kernelspec

RUN pip3 --no-cache-dir install --upgrade \
        http://download.pytorch.org/whl/torch-0.3.1-cp36-cp36m-macosx_10_7_x86_64.whl \
        # http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp27-cp27mu-linux_x86_64.whl 
        torchvision \
        tensorflow \
        tensorflow-tensorboard \
        # keras \
        # xgboost \
        # pymc3 \
        # pystan \
        # gensim \
        # nltk \
        # opencv-python

