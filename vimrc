call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/bash-support'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

# see https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed