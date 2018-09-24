# Docker for Machine Learning with Python3

## Introduction

[Wikipedia:](https://en.wikipedia.org/wiki/Docker_(software)) "Docker is a software technology providing containers, promoted by the company Docker, Inc. Docker provides an additional layer of abstraction and automation of operating-system-level virtualization on Windows and Linux. Docker uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and a union-capable file system such as OverlayFS and others to allow independent “containers” to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines (VMs)."

**Why Docker for Machine Learning?** We data scientists / machine learning engineers would like to solve data-driven problems and build machine learning-based products. Using docker to create (1) reproducibility, (2) compute environment portability, and (3) engineering applications, for example RESTful API for serving machine learning predictions, is a popular and wise choice. 

**Why Python?** Python is one of best languages for building data science applications, it is general purpose and engineering-oriented, with fairly good performance, making data preprocessing, machine learning and data visualizations easy, efficient and flexible. Nowadays, lots of top Internet services are built upon Python, including YouTube, Instegram, Quora, among many others.

**Why Python3?** Honestly, I use Python2 previously, and recently I knew that by the end of 2019, the scientific stack will stop supporting Python2. As for the most important scientific computing package in Python, **Numpy,** all of new feature releases will only support Python3 after 2018. Hence I decided to switch from Python2 to Python3, via docker!

## Docker Terminology

- **Image:** is essentially blueprint of the containers for what we would like to build.
- **Container:** is an instantiation of an image (For us Pythonistas, we can think image is a class, and container is the class's initialized object).
- **Dockerfile:** is a setup file to create/modify Docker images.
- **Docker-Compose:** is a tool for us to easily define and launch Docker applications.

## Docker Setup

### Install Docker

We can download and install docker on [docker website](https://www.docker.com/community-edition#/download), following the instructions we can finish the procedure easily. I choose Docker CE for Mac version. After installing we now have docker and docker-compose.

### Create Dockerfile

Many people leverage dockers contributed from many others, this is convenient and efficient for us to ramp up fast. Nevertheless, I prefer making my own docker (almost) from scratch, from this experience I can learn a lot and acquire fundamental knowledge of docker.

The first step is to create our Dockerfile; for details please refer to [Dockerfile](./Dockerfile). The Dockerfile is based on basic docker image for OS only, `ubuntu:16.04`. Then we install Python3's general packages, including 

- `Numpy`
- `Scipy`
- `Pandas`
- `Scikit-learn`
- `Jupyter`
- `Notedown`
- `Matplotlib`
- `Seaborn`
- `Cython`, etc, 

and machine learning frameworks, including 

- `TensorFlow`
- `MXNet`
- `PyTorch`
- `XGBoost`
- `PyMC`
- `PyStan`
- `Gensim`
- `NLTK`
- `OpenCV`

Finally, the remaining is to set up Jupyter Notebook. Note that we expose docker's port 8888 to Jupyter Notebook.

Note that of courese we can add/delete any general / machine learning packages in Dockerfile, as our needs.

### Create docker-compose.yml

To apply scripts as environment, we could create docker-compose.yml for us to easily launch docker, that is called **configuration as code;** for details please refer to [docker-compose.yml](./docker-compose.yml). In this file we assign what docker image (docker-ml:latest) we would like to use, what ports (8888:8888 and 6006:6006) to connect Jupyter Notebook and TensorBoard respectively, and what volums (./notebooks:/notebooks) to share data between our docker container and the host computer. Note that we use docker-compose.yml's version 3 format.

### Create jupyter_notebook_config.py

In this file, we set up Jupyter Notebook's IP, port and password, if set in environment; for details please refer to [jupyter_notebook_config.py](./jupyter_notebook_config.py). This jupyter_notebook_config.py will be copied to replace the original one in /root/.jupyter/. Note that basically we do not have to edit this file anymore.

### Create run_cmd.sh

Finally, in this file we collect bash scripts to launch Jupyter Notebook; for details please refer to [run_cmd.sh](./run_cmd.sh). Note that

- `--allow-root`: is needed, since we use root to launch docker.
- `--port 8888`: must be the same as docker's port for Jupyter Notebook.
- `--ip 0.0.0.0`: reassign Jupyter Notebook server's IP.
- `--NotebookApp.token=''`: optional, for simplicity we here disable the toker authentification. Note that this is not recommended for security reasons. Nevertheless, since I choose this to test launch on my local laptop I think it is ok for now.

To lanch TensorBoard, the pipielined bash scripts follow similarly.

## Launch Docker

### Build Docker Image

First build docker image with name `docker-ml:latest`, by docker CLI or docker-compose with Dockerfile.

```
# Build docker image by Docker CLI.
sudo docker build -t docker-ml:latest .

# Alternative, (re-)build by docker-compose, if needed.
docker-compose build
```

Now we can check docker images.

```
sudo docker images
```

### Create Docker Container

First based on newly built docker image, `docker-ml:latest`, to create docker container.

```
# Run docker image to create a container, by docker CLI.
sudo docker run -it -p 8888:8888 -p 6006:6006 docker-ml:latest
# Run in background mode.
sudo docker run -dt -p 8888:8888 -p 6006:6006 docker-ml:latest

# Alternatively, run using docker-compose with docker-compose.yaml.
docker-compose up
# Run docker compose in background.
docker-compose up -d
```

Then we can check docker container status:

```
docker ps -a
```

**Remarks:**

- If cannot access jupyter notebook server on browser, maybe port 8888 is ocupied by some unknown process, run this:

```
lsof -ti:8888 | xargs kill -9
```

- If your docker-compose is abnormally slow, add one of these in /etc/hosts by `sudo vim /etc/hosts`.

```
127.0.0.1 localunixsocket
127.0.0.1 localunixsocket.local
```

### Stop/Restart Docker Container

```
# Stop/restart docker container
sudo docker stop <docker_container_id>
sudo docker restart <docker_container_id>

# Stop/restart by docker compose.
docker-compose stop
docker-compose restart
docker-compose down
```

### Access Jupyter Notebook 

Finally, we can access Jupyter Notebook server from the browser at this URL:

```
http://0.0.0.0:8888
```

### Access TensorBoard

```
http://0.0.0.0:6006
```

Now enjoy your docker for machine learning with Python3 and Jupyter Notebook. :-)

### Go into Bash Mode

```
# Go into /bin/bash mode.
docker exec -it <docker_container_id> /bin/bash

# Exit bash mode.
exit
```

### Remove Docker Container / Image

```
# Remove docker container.
sudo docker rm <docker_container_id>

# Remove docker images.
sudo docker rmi <docker_image_id>
```

## Share Our Image to DockerHub

We can rebuild our local images following the naming rule, `<hub-user>/<repo-name>[:<tag>]`, or re-tagging an existing local image.

```
# Rebuild docker image.
docker build -t bowen0701/docker-python3-ml-jupyter

# Retag docker image.
docker tag docker-ml bowen0701/docker-python3-ml-jupyter
```

The final step is to push renamed docker image to DockerHub.

```
docker push bowen0701/docker-python3-ml-jupyter
```

### Pull Docker Image

You can pull my docker image from [Docker Hub](https://hub.docker.com/r/bowen0701/docker-python3-ml-jupyter/), using 

```
docker pull bowen0701/docker-python3-ml-jupyter
```

Then retag docker image:

```
docker tag bowen0701/docker-python3-ml-jupyter docker-ml
```

By this retagging step, you can just use `docker-compose up` to launch docker service.

## References

- https://store.docker.com/community/images/tensorflow/tensorflow
- https://store.docker.com/community/images/dash00/tensorflow-python3-jupyter
- https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5
