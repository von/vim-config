" SInit(): Create or load a session
" Intended to be used as: vi -c 'call SInit("mysession")'
function! SInit(sessionName)
  let sessionFile = expand(g:startify_session_dir . "/" . a:sessionName)
   if filereadable(sessionFile)
     exec ":SLoad " . a:sessionName
     let g:startify_disable_at_vimenter = 1
   else
     exec ":SSave " . a:sessionName
   endif
endfunction
