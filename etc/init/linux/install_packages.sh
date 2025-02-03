#!/bin/bash -e


sudo apt update && 
sudo apt install -y silversearcher-ag

# install broot
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
sudo apt-get update && sudo apt-get -y install broot


# install fzf (fzf must be installed after zsh)
sudo apt install -y fd-find # A simple, fast and user-friendly alternative to 'find' (fzf rely on fd)

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-key-bindings --no-update-rc --no-completion