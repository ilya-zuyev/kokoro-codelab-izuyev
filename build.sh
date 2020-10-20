#!/bin/bash

set -e

if [ "$1" == "release" ]; then
    javac -g:none Hello.java
else
    javac Hello.java
fi

