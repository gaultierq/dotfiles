#!/bin/bash -e

sudo -v
apt-get update &&

apt-get install \
git \
tree \
zsh \
htop \
curl \
wget && 


echo "Installing zsh"
apt-get install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

echo "Installing oh-my-zsh"
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


sudo -k