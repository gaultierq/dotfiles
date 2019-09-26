#!/bin/bash -e

sudo -v
sudo apt-get update &&

sudo apt-get -y --force-yes install \
git \
tree \
rsync \
zsh \
htop \
curl \
openvpn \
unzip \
wget && 



echo "Installing zsh"
sudo apt-get -y --force-yes install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

echo "Installing vim (python compiled)"
mkdir tmp && cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure --enable-pythoninterp --prefix=/usr
make && sudo make install

# cleaning unused dependencies
sudo apt-get autoremove -y --force-yes
sudo -k
