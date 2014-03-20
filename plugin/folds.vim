" Folding configuration

" Enable folding for shell scripts
" Value is OR of functions (1), heredoc (2) and if/do/for (4)
let g:sh_fold_enabled = 7 

" Open all folds with ':unfold'
cabbrev unfold norm zR

" Close all folds with ':fold'
cabbrev fold norm zM
