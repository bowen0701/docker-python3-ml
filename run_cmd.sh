#! /bin/bash

jupyter notebook --no-browser --allow-root --port 8888 --ip 0.0.0.0 --NotebookApp.token='' & tensorboard --port 6006 --logdir="./graphs"
