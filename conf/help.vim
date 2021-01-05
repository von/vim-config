" Configuration related to help

" Open help in a new tab
" Kudos: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
augroup HelpToTab
  autocmd!
  autocmd BufEnter *.txt call s:helptab()
augroup END
