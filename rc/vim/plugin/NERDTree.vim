" start NerdTree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp']


"nerdtree reveal in tree
nmap <leader>r :NERDTreeFind<CR>
"toggle nerdtree
nmap ,m :NERDTreeToggle<CR>
" open nerd tree
map <C-n> :NERDTreeToggle<CR>


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


let g:nerdtree_tabs_open_on_console_startup=1

" Give more space for displaying messages.
set cmdheight=2
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
