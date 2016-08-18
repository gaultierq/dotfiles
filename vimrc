call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'bash-support.vim'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'powerline/powerline'
Plug 'scrooloose/nerdcommenter'
Plug 'stanangeloff/php.vim'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

set clipboard=unnamed

" let netrw be a tree
let g:netrw_liststyle=3

syntax enable
set background=dark
" let g:solarized_termcolors=256
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

" display line numbers
set number
" set foldcolumn=3
" set nuw=6

" start NerdTree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open nerd tree
map <C-n> :NERDTreeToggle<CR>
