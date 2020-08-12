# is_exists() {
#     which "$1" >/dev/null 2>&1
#     return $?
# }
# following is compiling vim to work with python. But it can be long especially on raspberry
# if is_exists "vim"; then
# 	echo "vim installed"
# else
# 	echo "Installing vim from source"
# 	mkdir tmp && cd /tmp && git clone https://github.com/vim/vim.git && cd vim
# 	./configure --enable-pythoninterp --prefix=/usr
# 	make && sudo make install
# fi


if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "install vim-plug (a vim plugin manager)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	
fi