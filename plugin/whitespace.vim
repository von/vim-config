" Configuration related to whitespace

" Whitespace cleanup

" WhitespaceClean {{{ "
function! WhitespaceClean()
  " Convert tabs to 4 spaces
  call Preserve(':%s/	/    /ge')
  " Remove trailing whitespace
  call Preserve(':%s/\v\s+$//e')
endfunction
" }}} WhitespaceClean "

cabbrev clean call WhitespaceClean()

" Make whitespace visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
