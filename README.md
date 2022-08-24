[![CircleCI](https://dl.circleci.com/status-badge/img/gh/IrisStream/project-4/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/IrisStream/project-4/tree/main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### How to run

**prerequisites**:
- `hadolint` 
- `kubectl`
- `minikube`

```bash
# Create environment
make setup # can also run make setup-conda if using conda instead

# Install dependencies
make install 

# check linting python & Dockerfile
make lint 

# create & run docker container
./run_docker.sh 

# sending request for checking api server
./make_prediction.sh

# upload docker image to docker hub
./update_docker.sh 

# Create kubenestes cluster locally with minikube 
minikube start 

# Create pod from image above and forward port to host
./run_kubernetes.sh

# Testing by sending request
./make_prediction
```

To stop everthing, simply run `minikube delete`

### Files explaination 
 - `app.py`: python source code that input a request and output the prediction 
 - `requirements.txt`: dependencies for python source code 
 - `Makefile`: Makefile for run `make` 
 - `Dockerfile`: docker definition file for creating a docker image 
 - `make_prediction.sh`: send a request to api server to get the prediction 
 - `run_docker.sh`: build docker image and run docker image
 - `run_kubernetes.sh`: create a pod in kubernetes cluster and forwarding the port from pod to host 
 - `upload_docker.sh`: upload docker image to docker hub
 - `output_txt_files`: output log of docker and kubernetes
 - `model_data`: data for prediction