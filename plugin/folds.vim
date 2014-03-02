" Folding configuration

" Enable folding for shell scripts
" Value is OR of functions (1), heredoc (2) and if/do/for (4)
let g:sh_fold_enabled = 7 

" 'F' folds if on fold, else acts normally
" Normally does reverse of 'f'
nnoremap <silent> F za
vnoremap F zf

" Open all folds
map <leader>unfold zR

" Close all folds
map <leader>fold zM
