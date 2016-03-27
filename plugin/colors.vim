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
" ColorColumn {{{

" For colorcolumn on column 80 (DarkGoldenRod)
highlight ColorColumn ctermbg=136

" }}} SignColumn
"----------------------------------------------------------------------
" Folds {{{ "

" Make folds blue on grey (same as line numbers)
hi Folded ctermfg=021 ctermbg=234

" }}} Folds "
"----------------------------------------------------------------------
" Completion Menu {{{
" Kudos: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue
" }}} Completion Menu
