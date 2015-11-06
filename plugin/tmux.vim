"tmux related configuration

" Set title if we are in tmux
" Kudos: http://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
" The concatenation of the colon is to prevent vim from
" interpreting the string as a modeline.
augroup TmuxTitle
  autocmd!
  autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter,ShellCmdPost * call system('tmux rename-window vi' . ':' . expand("%"))
augroup END
