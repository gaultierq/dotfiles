#!/bin/bash

if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "install vim-plug (a vim plugin manager)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	
fi 


#echo "Installing oh-my-zsh"
# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"