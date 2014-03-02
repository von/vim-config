" Session configuration

" TODO: Both sessionoptions and viewoptions contain 'options' and I think
"  this causes conflicts, like foldmethod getting lost.

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Save and load session using Obsession
silent !mkdir ~/.vim-local/sessions/ > /dev/null 2>&1
nmap <leader>ss :wa<cr>:Obsession $HOME/.vim-local/sessions/
nmap <leader>ls :wa<cr>:source $HOME/.vim-local/sessions/

