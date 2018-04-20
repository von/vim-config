" SInit(): Create or load a session
" Intended to be used as: vi -c 'call SInit("mysession")'
function! SInit(sessionName)
  let sessionFile = expand(g:startify_session_dir . "/" . a:sessionName)
  " Disable startify menu
  let g:startify_disable_at_vimenter = 1
  if filereadable(sessionFile)
    exec ":SLoad " . a:sessionName
  else
    exec ":SSave " . a:sessionName
  endif

  " Save session every time we create or delete a buffer
  augroup SInitRegularSave
    autocmd!
    exec "autocmd BufAdd * :SSave! " . a:sessionName
    exec "autocmd BufDelete * :SSave! " . a:sessionName
  augroup END
endfunction
