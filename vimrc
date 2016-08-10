call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'bash-support.vim'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'powerline/powerline'
Plug 'scrooloose/nerdcommenter'
Plug 'stanangeloff/php.vim'
call plug#end()

set clipboard=unnamed

" let netrw be a tree
let g:netrw_liststyle=3

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans =   1
let g:solarized_degrade   =   0
let g:solarized_bold      =   1
let g:solarized_underline =   1
let g:solarized_italic    =   1
let g:solarized_contrast  =   "normal"|   "high" or "low"
let g:solarized_visibility=   "normal"|   "high" or "low"
colorscheme solarized


filetype plugin on

" ::::::::: Initialization ::::::::::::::::

syntax enable

set runtimepath+=~/dotfiles
runtime! etc/init/vim/**.vim
