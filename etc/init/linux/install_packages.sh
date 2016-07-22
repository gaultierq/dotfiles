#!/bin/bash -e

sudo -v
sudo apt-get update &&

sudo apt-get -y --force-yes install \
git \
tree \
zsh \
htop \
curl \
wget && 


echo "Installing zsh"
sudo apt-get -y --force-yes install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

sudo -k
