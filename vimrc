
"set runtimepath+=~/dotfiles
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'bash-support.vim'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
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
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim' " python indent
Plug 'Valloric/YouCompleteMe' " python autocomplete
Plug 'scrooloose/syntastic' " python lint
Plug 'nvie/vim-flake8'
Plug 'dkprice/vim-easygrep'
call plug#end()

set runtimepath+=~/dotfiles
runtime! etc/init/vim/**.vim

set clipboard=unnamed

set encoding=utf-8

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
"map  <C-l> :tabn<CR>
"map  <C-h> :tabp<CR>
"map  <C-n> :tabnew<CR>
"map  <C-Right> :tabn<CR>
"map  <C-Left> :tabp<CR>

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

let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif


" <<< quit vim if last buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


" >>> quit vim if last buffer


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
"


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


" PEP8 standarts (python)
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" other standarts
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" python Auto-complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" nince python
let python_highlight_all=1
syntax on


let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1 
let g:EasyGrepHidden=1
