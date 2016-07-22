#!/bin/bash -e

sudo -v
sudo apt-get update &&

sudo apt-get -y  install \
git \
tree \
zsh \
htop \
curl \
wget && 


echo "Installing zsh"
sudo apt-get -y install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

sudo -k
