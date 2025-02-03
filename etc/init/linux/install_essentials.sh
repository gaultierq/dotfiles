#!/bin/bash -e

# minimum setup

sudo apt update &&

sudo apt install -y  \
git \
tree \
rsync \
htop \
curl \
openvpn \
unzip \
wget \
tmux \
locales 


sudo locale-gen en_US.UTF-8

# cleaning unused dependencies
echo "cleaning..."
sudo apt-get autoremove -y --force-yes
sudo -k
