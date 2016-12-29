" Set window title based on current buffer
" Kudos:
" http://vim.wikia.com/wiki/Automatically_set_screen_title

" Turn on setting the title.
set title

" The following causes vim to refresh the title each time we change buffers.
" Otherwise it will only set the title once at startup.
augroup RefreshTitle
  autocmd!
  " The concatenation of the colon is a hack to prevent vim from
  " interpreting the string as a modeline.
  autocmd BufEnter * let &titlestring = "vim" . ":" . expand("%:t")
augroup END
