" Session configuration

" TODO: Both sessionoptions and viewoptions contain 'options' and I think
"  this causes conflicts, like foldmethod getting lost.

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Save and load session using Obsession
let s:sessions="~/.vim-local/sessions/"

execute 'silent !mkdir ' . s:sessions . ' > /dev/null 2>&1'

" SessionLoad() {{{ "
function! SessionLoad(name)
  wa
  let file=s:sessions . a:name
  source file
endfunction
" }}} SessionLoad() "

command! -nargs=1 SLoad call SessionLoad("<args>")

" SessionSave() {{{ "
function! SessionSave(name)
  wa
  let file=s:sessions . a:name
  Obsession file
endfunction
" }}} SessionSave() "

command! -nargs=1 SSave call SessionSave("<args>")
