" Automatically LCD to local file directory on entering buffer
" I do this as autochdir doesn't seem to work reliably.
" Kudos: https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file

function! AutoCD()
  if &buftype == 'terminal' || &filetype == 'git'
    return
  endif
  silent lcd %:p:h
endfunction

augroup AutoCD
  autocmd!
  autocmd BufEnter * call AutoCD()
augroup END
