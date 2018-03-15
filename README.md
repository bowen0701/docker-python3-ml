# Docker for Machine Learning with Python3

## Introduction

[Wikipedia:](https://en.wikipedia.org/wiki/Docker_(software)) "Docker is a software technology providing containers, promoted by the company Docker, Inc. Docker provides an additional layer of abstraction and automation of operating-system-level virtualization on Windows and Linux. Docker uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and a union-capable file system such as OverlayFS and others to allow independent “containers” to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines (VMs)."

**Why Docker for Machine Learning?** We data scientists / machine learning engineers would like to solve data-driven problems and build machine learning-based products. Using docker to create (1) reproducibility, (2) compute environment portability, and (3) engineering applications, for example RESTful API for serving machine learning predictions, is a popular and wise choice. 

**Why Python?** Python is one of best languages for building data science applications, it is general purpose and engineering-oriented, with fairly good performance, making data preprocessing, machine learning and data visualizations easy, efficient and flexible. Nowadays, lots of top Internet services are built upon Python, including YouTube, Instegram, Quora, among many others.

**Why Python3?** Honestly, I use Python2 previously, and recently I knew that by the end of 2019, the scientific stack will stop supporting Python2. As for the most important scientific computing package in Python, **Numpy,** all of new feature releases will only support Python3 after 2018. Hence I decided to switch from Python2 to Python3, via docker!

## Docker Terminology

- **Image:** is essentially blueprint of the containers for what we would like to build.
- **Container:** is an instantiation of an image. (For us Pythonistas, we can think image is a class, and container is the class's initialized object. :-))
- **Dockerfile:** is a setup file to create/modify Docker images.
- **Docker-Compose:** is a tool for us to easily define and launch Docker applications.

## Docker Setup

### Install Docker

You can download and install docker on [docker website](https://www.docker.com/community-edition#/download), following the instructions you can finish the procedure easily. I choose Docker CE for Mac version.

### Create Dockerfile

Many people leverage dockers contributed from many others, this is convenient and efficient for us to ramp up fast. Nevertheless, I prefer making my own docker (almost) from scratch, from this experience I can learn a lot and acquire fundamental knowledge of docker.

The first step is to create our Dockerfile, For details please refer to [Dockerfile](./Dockerfile). The Dockerfile is based on basic docker image for OS only, ubuntu:16.04. Then we install Python3's general packages, including 

- `Numpy`
- `Scipy`
- `Pandas`
- `Scikit-learn`
- `Jupyter`
- `Matplotlib`
- `Seaborn`
- `Cython`, etc, 

and machine learning frameworks, including 

- `PyTorch`
- `TensorFlow`
- `Keras`
- `XGBoost`
- `PyMC`
- `PyStan`
- `Gensim`
- `NLTK`, and 
- `OpenCV`.

Finally, the remaining is to set up Jupyter Notebook. Note that we expose docker's port 8888 to Jupyter Notebook.

### Create docker-compose.yml

TBD
