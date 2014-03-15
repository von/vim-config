" Save and restore views automatically
" Mainly used for fold state

silent !mkdir ~/.vim-local/views/ > /dev/null 2>&1
set viewdir=~/.vim-local/views/

set viewoptions-=options

" Save and load without errors
" Kudos: http://dotfiles.org/~tsukkee/.vimrc
" via: https://ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds/
augroup autoview
  autocmd!
  autocmd BufWritePost *
        \   if expand('%') != '' && &buftype !~ 'nofile'
        \|      mkview
        \|  endif
  autocmd BufRead *
        \   if expand('%') != '' && &buftype !~ 'nofile'
        \|      silent loadview
        \|  endif
augroup END

" Reload without loading view (or any other autocommand)
cabbrev reload noautocmd e
