" Configuration related to scratch plugin

" Toggle scratch buffer (scratch.vim plugin)
" Kudos: http://blog.mojotech.com/a-veterans-vimrc/
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction
