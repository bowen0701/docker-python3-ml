# Docker settings: Ubuntu, Python3, pip, general machine learning frameworks, Jupyter Notebook.

FROM ubuntu:18.04

LABEL maintainer="Bowen Li <bowen0701@gmail.com>"

# Pick up some Python3 dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng-dev \
        libzmq3-dev \
        pkg-config \
        graphviz \
        # python \
        # python-dev \
        # python-pip \
        # python-setuptools \
        python3.6 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python3 general packages.
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade \
        numpy \
        scipy \
        pandas \
        sklearn \
        ipykernel \
        jupyter \
        notedown \
        matplotlib \
        seaborn \
        tqdm \
        # Cython \
        # Pillow \
        requests \
        # awscli \
        && \
    python3 -m ipykernel.kernelspec

# Install machine learning packages.
RUN pip3 --no-cache-dir install --upgrade \
        torch==1.2.0 \
        torchvision==0.4.0 \
        torchviz \
        tensorflow==1.15.0 \
        tensorboard==1.15.0
        # mxnet
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
COPY run_cmd.sh /

# Jupyter Notebook
EXPOSE 8888
# TensorBoard
EXPOSE 6006

# WORKDIR /notebooks

RUN chmod +x /run_cmd.sh

CMD ["/run_cmd.sh"]
