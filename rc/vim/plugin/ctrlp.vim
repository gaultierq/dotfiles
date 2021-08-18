let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction
