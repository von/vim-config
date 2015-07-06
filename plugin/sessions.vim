" Session configuration

" TODO: Both sessionoptions and viewoptions contain 'options' and I think
"  this causes conflicts, like foldmethod getting lost.

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

let g:startify_session_dir = '~/.vim-local/sessions'
silent !mkdir ~/.vim-local/sessions > /dev/null 2>&1

" Automatically save sessions when leaving vim or loading another sessions
let g:startify_session_persistence = 1
