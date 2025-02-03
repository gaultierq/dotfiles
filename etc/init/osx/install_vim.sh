#!/bin/bash -e


echo "Installing neovim"

# install lazyvim
[[ ! -d ~/.config/nvim ]] && git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove the .git folder, so you can add it to your own repo later
# FIXME: this will erase local config
rm -rf ~/.config/nvim/.git

sudo apt update && sudo apt install -y neovim


if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "install vim-plug (a vim plugin manager)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	
fi

nvim +PlugInstall +qall