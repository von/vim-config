" Configuration related to scratch plugin

map <leader>scr :ScratchOpen<cr>
" Open scratch buffer automatically if no files given on commandline
" Note this handles if vim is started with a session (-S) as well
" Kudos: http://stackoverflow.com/a/15846999/197789
autocmd vimenter * if bufname("%") == "" | ScratchOpen | endif
