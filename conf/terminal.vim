" Configuration for :terminal buffers

augroup TerminalOptions
  autocmd!
  " Disable line numbers as hey clutter normal mode
  autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | endif
augroup END
