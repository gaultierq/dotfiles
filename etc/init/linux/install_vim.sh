#!/bin/bash -e


echo "Installing neovim"

# install lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

sudo apt-get update &&
sudo apt-get -y --force-yes install neovim



if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "install vim-plug (a vim plugin manager)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	
fi