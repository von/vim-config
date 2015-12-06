" Configuration related to whitespace

" Whitespace cleanup

" WhitespaceClean {{{ "
function! WhitespaceClean()
  " Convert tabs to spaces (number as specified by tabstop)
  let s:spaces = strpart('                ', 0, &tabstop)
  call Preserve(':%s/\t/' . s:spaces . '/ge')
  " Remove trailing whitespace
  call Preserve(':%s/\v\s+$//e')
endfunction
" }}} WhitespaceClean "

CommandCabbr clean call<space>WhitespaceClean()

" Make whitespace visible
set list listchars=tab:⋅⋅,trail:⋅,nbsp:⋅

