" Folding for conf files
" Use '#######+" followed by fold title to indicate first-level fold
" Use '######" followed by fold title to indicate second-level fold
" Use '#------+' to close all folds
" Use '#-----' to close second-level fol
" Requires hashfold.vim

setlocal foldmethod=expr
let &l:foldexpr =  'HashFoldExpr()'
let &l:foldtext =  'HashFoldText()'
