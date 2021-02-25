#!/bin/bash -e

echo "Minikube start"

minikube config set memory 6144
minikube config set cpus 2
minikube config set driver docker
minikube start
