" Maintain a cwd for each tab
" Kudos: https://github.com/kana/vim-tabpagecd
augroup TabCwd
  autocmd!

  autocmd TabEnter *
  \   if exists('t:cwd')
  \ |   cd `=t:cwd`
  \ | endif

  autocmd TabLeave *
  \   let t:cwd = getcwd()

augroup END
