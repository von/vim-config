 " Turn on extra highlighting of various types of files
 let g:netrw_special_syntax= 1

" Don't show swap files in netrw.
" Note that vim-vinegar overrides netrw_list_hide with contents of
" wildignore, so use it instead.
"let g:netrw_list_hide= '.*\.swp$,.*\.swo$'
set wildignore+=*.swp
set wildignore+=*.swo
