#!/bin/bash -e

sudo -v
sudo apt-get update &&

sudo apt-get -y --force-yes install \
git \
tree \
rsync \
htop \
curl \
openvpn \
unzip \
wget


# cleaning unused dependencies
echo "cleaning..."
sudo apt-get autoremove -y --force-yes
sudo -k
