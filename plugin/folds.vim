" Folding configuration

" Enable folding for shell scripts
" Value is OR of functions (1), heredoc (2) and if/do/for (4)
let g:sh_fold_enabled = 7 

" Open all folds with ':unfold'
CommandCabbr unfold norm<space>zR

" Close all folds with ':fold'
CommandCabbr fold norm<space>zM
