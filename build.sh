#!/bin/bash


docker ps
docker version
env

echo "============================="

curl -LO https://github.com/kubernetes/minikube/releases/download/v1.14.0/minikube-darwin-amd64
local -r MK=./minikube-darwin-amd64 
chmod +x ${MK}
${MK} start --driver=docker
${MK} status
kubectl get pods

env | sort 
echo "============================="
eval $(${MK} docker-env)

env | sort 

echo "============================="
kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
sleep 60

kubectl port-forward deployment/nginx-deployment 7777:80 &
curl localhost:7777
kubectl delete deploy --all

set -e

if [ "$1" == "release" ]; then
    javac -g:none Hello.java
else
    javac Hello.java
fi

