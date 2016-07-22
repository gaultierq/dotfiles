#!/bin/bash -e

sudo -v
apt-get update &&

apt-get install \
git \
zsh \
htop \
curl \
wget && 

sudo -k