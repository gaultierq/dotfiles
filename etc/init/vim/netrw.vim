" Netrw & Vinegar




" netrw files stay on the left
let g:netrw_altv=1

" enable mouse usage. makes it easier to browse multiple tabs
" hide netrw top message
" let g:netrw_banner=0

" remap shift-enter to fire up the sidebar
" nnoremap <silent> <S-CR> :rightbelow 20vs<CR>:e .<CR>
" the same remap as above - may be necessary in some distros
" nnoremap <silent> <C-M> :rightbelow 20vs<CR>:e .<CR>
" remap control-enter to open files in new tab
" nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>
" the same remap as above - may be necessary in some distros
" nmap <silent> <NL> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>

let g:netrw_dirhistmax=100      " keep more history
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_alto=0              " open files on right
let g:netrw_winsize=20          " preview winsize
let g:netrw_preview=1           " open previews vertically
" let g:netrw_use_errorwindow=0   " suppress error window
