#!/bin/bash


docker ps
docker version
env

set -e

if [ "$1" == "release" ]; then
    javac -g:none Hello.java
else
    javac Hello.java
fi

