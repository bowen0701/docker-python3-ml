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

RUN pip3 install --upgrade pip \
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
        awscli \
        && \
    python3 -m ipykernel.kernelspec

RUN pip3 --no-cache-dir install --upgrade \
        http://download.pytorch.org/whl/cpu/torch-0.3.1-cp35-cp35m-linux_x86_64.whl \
        torchvision
        # tensorflow \
        # tensorflow-tensorboard \
        # keras \
        # xgboost \
        # pymc3 \
        # pystan \
        # gensim \
        # nltk \
        # opencv-python

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
COPY notebooks /notebooks

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR /notebooks

RUN chmod +x /run_jupyter.sh

CMD ["/run_jupyter.sh"]
