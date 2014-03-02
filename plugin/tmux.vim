"tmux related configuration

" Set title if we are in tmux
" Kudos: http://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system('tmux rename-window vi:' . expand("%"))
