nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
	" Use persistent history.
	if !isdirectory("/tmp/.vim-undo-dir")
		call mkdir("/tmp/.vim-undo-dir", "", 0700)
	endif
	set undodir=/tmp/.vim-undo-dir
	set undofile
endif
