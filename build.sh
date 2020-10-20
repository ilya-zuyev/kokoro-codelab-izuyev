#!/bin/bash


docker ps
docker version
env

curl -LO https://github.com/kubernetes/minikube/releases/download/v1.14.0/minikube-darwin-amd64
chmod +x minikube-darwin-amd64
./minikube-darwin-amd64 start --driver=docker
sleep 60
./minikube-darwin-amd64 status
kubectl get pods
env

set -e

if [ "$1" == "release" ]; then
    javac -g:none Hello.java
else
    javac Hello.java
fi

