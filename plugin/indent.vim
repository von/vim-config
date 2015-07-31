" Configuration related to indentation

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=8

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Allow me to turn tabs on and off
CommandCabbr tabs set<space>noexpandtab
CommandCabbr notabs set<space>expandtab

" Re-indent, whole file or selected area
" Kudos: http://vim.wikia.com/wiki/Fix_indentation
CommandCabbr indent call<space>Preserve(':normal<space>gg=G')
" ALternative to above is use '==' to re-indent current line or selection,
" or '<n>==' (e.g. '5==') to re-indent <n> lines

" Have < and > (change indentation) keep visual selection active
" Kudos: http://stackoverflow.com/a/3702781/197789
vnoremap < <gv
vnoremap > >gv

" Pasting {{{
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

" Allow me to turn off indentation for pasting
" Kudos: http://stackoverflow.com/a/2514520/197789
CommandCabbr paste set<space>paste
CommandCabbr nopaste set<space>nopaste

" }}}
