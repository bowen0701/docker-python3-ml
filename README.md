# Docker for Machine Learning with Python3

## Introduction

[From Wikipedia:](https://en.wikipedia.org/wiki/Docker_(software)) "Docker is a software technology providing containers, promoted by the company Docker, Inc. Docker provides an additional layer of abstraction and automation of operating-system-level virtualization on Windows and Linux. Docker uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and a union-capable file system such as OverlayFS and others to allow independent “containers” to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines (VMs)."

**Why Docker for Machine Learning?** We data scientists / machine learning engineers have to solve data-driven problems and build machine learning-based products. Using docker to create a consistent development environment and resolve software stack dependency hell is a popular and wise choice. 

**Why Python?** Python is one of best languages for building data science applications, it is general purpose and engineering-oriented, with fairly good performance, making data preprocessing, machine learning and data visualizations easy, efficient and flexible. Nowadays, lots of top Internet services are built upon Python, including YouTube, Instegram, Quora, among many others.

**Why Python3?** Honestly, I use Python2 previously, and recently I knew that by the end of 2019, the scientific stack will stop supporting Python2. As for the most important scientific computing package in Python, **Numpy,** all of new feature releases will only support Python3 after 2018. Hence I decided to switch from Python2 to Python3, via docker!

## Terminology

- **Container:** can be thought of as mini-Virtual Machine (VM) that are light-weight, disposable.
- **Images:** are essentially snapshots of the containers whose running state is saved using Docker Command Line Interface (CLI) or generated using **Dockerfile** (see below). 
- **Dockerfile:** can be considered as an automated setup file. This file is used to create/modify Docker images.

## Setup

