#!/bin/bash


docker ps
docker version


echo "==== env before installing minikube =="
env | sort
echo "============================="

curl -LO https://github.com/kubernetes/minikube/releases/download/v1.14.0/minikube-darwin-amd64
MK=./minikube-darwin-amd64 
chmod +x ${MK}
${MK} start --driver=docker
${MK} status
kubectl get pods

eval $(${MK} docker-env)
echo "==== env after eval \$(minikube docker-env) minikube =="
env | sort 
echo "============================="

kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
sleep 60
${MK} status
kubectl get pods

kubectl port-forward deployment/nginx-deployment 7777:80 &
sleep 20

curl localhost:7777
kubectl delete deploy --all

