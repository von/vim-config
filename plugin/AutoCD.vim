" Automatically LCD to local file directory on entering buffer
" I do this as autochdir doesn't seem to work reliably.
" Kudos: https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file

augroup AutoCD
  autocmd!
  autocmd BufEnter * silent lcd %:p:h
augroup END
