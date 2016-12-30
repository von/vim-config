" Session configuration

" Note that having an option in both sessionsoptions and viewoptions seems
" to cause problems. Right now I'm trying to remove them from viewoptions.
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,
  \options,resize,tabpages,winsize,winpos

" Startify configuration {{{ "

let g:startify_session_dir = '~/.vim-local/sessions'
silent !mkdir ~/.vim-local/sessions > /dev/null 2>&1

" Automatically save sessions when leaving vim or loading another session
let g:startify_session_persistence = 1

" }}} Startify configuration "
