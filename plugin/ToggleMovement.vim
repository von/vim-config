" ToggleMovement(firstOp, thenOp)
" Try firstOp, if that doesn't cause cursor movement, then execute thenOp
"
" Note that thenOp doesn't technically need to be a movement.
" I added 'silent!' on thenOp call so I could safely try toggling folds.
"
" Kudos: http://ddrscott.github.io/blog/2016/vim-toggle-movement/

function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "silent! normal! " . a:thenOp
  endif
endfunction
