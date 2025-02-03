#!/bin/bash -e
echo "Installing neovim"

# on outdated debian it doesnt work

# install lazyvim
[[ ! -d ~/.config/nvim ]] && git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
# TODO: my own config


# neovim installation hell
if [[ -f /etc/debian_version && $(uname -m) == "x86_64" ]]; then 
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	chmod u+x nvim-linux-x86_64.appimage
	mkdir -p $HOME/.local/bin
	mv nvim-linux-x86_64.appimage $HOME/.local/bin/nvim
else
	sudo apt update && sudo apt install -y neovim
fi


# plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "install vim-plug (a vim plugin manager)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	
fi

nvim +PlugInstall +qall