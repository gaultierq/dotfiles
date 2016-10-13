
"set runtimepath+=~/dotfiles
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
Plug 'joonty/vim-phpqa'
Plug 'shawncplus/phpcomplete.vim'
Plug 'ervandew/supertab' " tab auto completion
Plug 'ludovicchabant/vim-gutentags' " ctags generation
Plug 'tpope/vim-surround' " braces etc.
Plug 'schickling/vim-bufonly' " braces etc.

call plug#end()

set runtimepath+=~/dotfiles
runtime! etc/init/vim/**.vim

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
let g:solarized_contrast  =   "high" | "normal"|   "high" or "low"
let g:solarized_visibility=   "high" | "normal"|   "high" or "low"
colorscheme solarized

" activate mouse
set mouse=a


filetype plugin on

" ::::::::: Initialization ::::::::::::::::
syntax enable



" display line numbers
set number
" set foldcolumn=3
" set nuw=6

" start NerdTree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open nerd tree
map <C-n> :NERDTreeToggle<CR>

" inserts new lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Tab navigation (broken)
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <C-Right> :tabn<CR>
map  <C-Left> :tabp<CR>

" SuperTab recommended settings (no explanation...)
let g:SuperTabDefaultCompletionType = ""

set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 

" [TEST]: spaces in nno => insert mode
"nnoremap <space> i<space>
"nnoremap <tab> i<tab>
"nnoremap <BS> i<BS>

set incsearch "incremental search
set hlsearch "highlight search


" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" guten-tags & ctags management
let g:gutentags_tagfile = ".tags"

" rm search highligth
" nnoremap <esc> :noh<return><esc>

" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"set foldmethod=indent
noremap 4 :BufOnly<CR>

"nerdtree reveal in tree
nmap ,n :NERDTreeFind<CR>
"toggle nerdtree
nmap ,m :NERDTreeToggle<CR>
