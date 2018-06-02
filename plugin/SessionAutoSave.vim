" SessionAutoSave: automatically save session

function! SessionAutoSave()
  " Only do something if vim is done starting and we have a valid session
  " Saving a session while vim is loading will cause errors when it loaded
  if v:vim_did_enter && v:this_session != ""
    exec "mksession! " . v:this_session
  endif
endfunction

augroup SessionAutoSave
    autocmd!
    autocmd BufAdd * call SessionAutoSave()
    autocmd BufDelete * call SessionAutoSave()
augroup END
