#!/bin/bash -e

sudo -v
apt-get update &&

apt-get install \
git \
zsh \
htop \
curl \
wget && 

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo -k