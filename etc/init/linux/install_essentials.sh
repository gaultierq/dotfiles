#!/bin/bash -e

sudo apt-get update &&

sudo apt-get -y install \
git \
tree \
rsync \
htop \
curl \
openvpn \
unzip \
wget \
tmux \
silversearcher-ag

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-key-binding --no-update-rc --no-completion


# cleaning unused dependencies
echo "cleaning..."
sudo apt-get autoremove -y --force-yes
sudo -k
