" Cursor configuration

" Set cursor for insert and normal mode in tmux
" Kudos: https://gist.github.com/andyfowler/1195581

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Not that after changing back to normal mode, because <Esc> has
" other bindings, one has to press another key before the change
" completes or wait for ttimeoutlen to pass.
