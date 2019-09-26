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

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

echo "Installing zsh"
sudo apt-get -y --force-yes install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"


if is_exists "vim"; then
	echo "vim installed"
else
	echo "Installing vim from source"
	mkdir tmp && cd /tmp && git clone https://github.com/vim/vim.git && cd vim
	./configure --enable-pythoninterp --prefix=/usr
	make && sudo make install
fi

# cleaning unused dependencies
echo "cleaning..."
sudo apt-get autoremove -y --force-yes
sudo -k
