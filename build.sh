#!/bin/bash


echo "==== env before installing minikube =="
env | sort
echo "============================="

echo "==== memory =="
cat /proc/meminfo
echo "============================="

curl -LO https://github.com/kubernetes/minikube/releases/download/v1.14.0/minikube-darwin-amd64
MK=./minikube-darwin-amd64 
chmod +x ${MK}

${MK} start --driver=docker --alsologtostderr -v=2
${MK} status
