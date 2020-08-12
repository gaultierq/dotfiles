#!/bin/bash

docker build -t dotfile . && docker run -it dotfile $1