" Configuration related to colors
" For list of colors see $VIMRUNTIME/rgb.txt
" To see all colors, run the following:
" :runtime syntax/colortest.vim
" For colors by 0-256 number, see http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim

" Prevents dark fonts
set background=dark

"----------------------------------------------------------------------
" CursorLine {{{ "

:set cursorline

" Medium-grey background for line cursor is on
:hi CursorLine   cterm=NONE ctermbg=236 ctermfg=None

" }}} CursorLine "
"----------------------------------------------------------------------
" Customize tabbar {{{
" http://stackoverflow.com/a/7238163/197789
"
" Active label
:hi TabLineSel   guifg=Yellow guibg=DarkBlue gui=bold ctermfg=Yellow ctermbg=DarkBlue cterm=bold,underline
" Inactive labels
:hi TabLine      guifg=White guibg=DarkBlue gui=none ctermfg=White ctermbg=DarkBlue cterm=none
" Remainder of tabbar
:hi TabLineFill  guifg=White guibg=DarkBlue gui=none ctermfg=White ctermbg=DarkBlue cterm=none

" }}}
"----------------------------------------------------------------------
" Linenumbers {{{
"
" Line numbers are light blue with dark grey background.
" This also controls the line numbers for pylint errors.
hi LineNr         ctermfg=050 ctermbg=234

" }}} Linenumbers
"----------------------------------------------------------------------
" SignColumn {{{

" For git-gutter
" Clear so we use LineNr
highlight clear SignColumn

" }}} SignColumn
"----------------------------------------------------------------------
" Statusline {{{ "

function! StatusLineInsertEnter(mode)
  " Mode is 'i' for insert, 'r' for replace or 'v' for virtual insert
  " But we are ignoring it

  " Status line colors for pane with focus
  hi StatusLine ctermfg=black ctermbg=yellow cterm=none

  " Status line colors for panes without focus
  hi StatusLineNC ctermfg=black ctermbg=cyan cterm=none

  " statline colors (linking causes some inverse fields)
  " filename
  hi User1 ctermfg=blue ctermbg=yellow cterm=none
  " flags
  hi User2 ctermfg=black ctermbg=yellow cterm=none
  " errors
  hi User3 ctermfg=Red ctermbg=yellow cterm=none
  " fugitive
  hi User4 ctermfg=black ctermbg=yellow cterm=none
endfunction

function! StatusLineInsertLeave(mode)
  " mode as with StatusLineInsertEnter() - again ignored

  " Status line colors for pane with focus
  hi StatusLine ctermfg=black ctermbg=white cterm=none

  " Status line colors for panes without focus
  hi StatusLineNC ctermfg=black ctermbg=cyan cterm=none

  " statline colors (linking causes some inverse fields)
  " filename
  hi User1 ctermfg=blue ctermbg=white cterm=none
  " flags
  hi User2 ctermfg=black ctermbg=white cterm=none
  " errors
  hi User3 ctermfg=Red ctermbg=white cterm=none
  " fugitive
  hi User4 ctermfg=black ctermbg=white cterm=none
endfunction

" set up to change based on being in insert mode
if version >= 700
  au InsertEnter * call StatusLineInsertEnter(v:insertmode)
  au InsertLeave * call StatusLineInsertLeave(v:insertmode)

  " Set up initial colors
  call StatusLineInsertLeave(v:insertmode)
endif

" }}} Statusline
"----------------------------------------------------------------------
" Folds {{{ "

" Make folds blue on grey (same as line numbers)
hi Folded ctermfg=021 ctermbg=234

" }}} Folds "
