#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=irisstream/udacity-project

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-project-pod --image=$dockerpath


# Step 3:
# List kubernetes pods
kubectl get pods

# wait for pod to be ready
echo "waiting for pod to be ready"
while [ $(kubectl get pods | grep udacity-project-pod | awk '{print $3}') != "Running" ]; do
  sleep 5
done
echo "pod is ready"
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/udacity-project-pod --address 0.0.0.0 8000:80

