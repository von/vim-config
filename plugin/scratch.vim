" Configuration related to scratch plugin

cabbrev scratch ScratchOpen

" Open scratch buffer automatically if no files given on commandline
" Note this handles if vim is started with a session (-S) as well
" Kudos: http://stackoverflow.com/a/15846999/197789
augroup VimenterScr
  autocmd!
  autocmd vimenter * if bufname("%") == "" | ScratchOpen | endif
augroup END
