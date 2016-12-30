" Automatically enter and leave paste mode when pasting
" Kudos: https://coderwall.com/p/if9mda

" Note this makes using Esc in insert mode trickier since vim has to wait and
" see what your intent it. You can use C-c instead to exit insert mode.
" Kudos: http://stackoverflow.com/a/1278813/197789

" Note that if you use Vim inside of a Tmux session then you need
" to double escape the codes in tSI/tEI.
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
