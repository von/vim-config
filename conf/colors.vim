" Configuration related to colors
" For list of colors see $VIMRUNTIME/rgb.txt
" To see all colors, run the following:
" :runtime syntax/colortest.vim
" For colors by 0-256 number, see:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim

" Prevents dark fonts
set background=dark

"----------------------------------------------------------------------
" Set CursorLine based on insert mode {{{ "
" Kudos: http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode

:set cursorline

function! SetCursorLineColor(mode)
  " Turn off underline and any foreground changes
  hi CursorLine cterm=None ctermfg=None
  if a:mode == 'i'  " Insert mode
    hi CursorLine ctermbg=22  " Dark blue
  elseif a:mode == 'r'  " Replace mode
    hi CursorLine ctermbg=18  " Dark green
  elseif a:mode == 'v'  " Virtual Replace mode
    hi CursorLine ctermbg=18  " Dark green
  else " Not in insert mode
    hi CursorLine ctermbg=236  " Medium grey
  endif
endfunction

au InsertEnter * call SetCursorLineColor(v:insertmode)
au InsertChange * call SetCursorLineColor(v:insertmode)
au InsertLeave * call SetCursorLineColor("-")

" Only highlight CursorLine in current buffer
" Kudos: http://stackoverflow.com/a/12018552/197789
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

" Set default for start up
call SetCursorLineColor("-")

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
" To look good, this should match inactive tmux window color.
hi LineNr         ctermfg=039 ctermbg=236

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
" To look good, the background should match inactive tmux window color.
hi Folded ctermfg=039 ctermbg=236

" }}} Folds "
"----------------------------------------------------------------------
" Completion Menu {{{
" Kudos: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue
" }}} Completion Menu
"----------------------------------------------------------------------
" Help {{{ "
" Get rid of colored backgrounds
highlight  helpNote ctermfg=yellow ctermbg=none
highlight  helpTodo ctermfg=green ctermbg=none
highlight  helpError ctermfg=red ctermbg=none cterm=underline
highlight  helpHyperTextJump ctermfg=red ctermbg=none
" }}} Help "
"----------------------------------------------------------------------
" Spell checking {{{ "
" Make misspellings red and underlined instead of red background
" Kudos: http://stackoverflow.com/a/6009026/197789
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi clear SpellCap
hi SpellCap cterm=underline ctermfg=red
hi clear SpellRare
" }}} Spell checking "
"----------------------------------------------------------------------
" TODO/XXX in comments {{{
hi clear VimTodo
hi VimTodo cterm=underline ctermfg=yellow

hi link zshTodo VimTodo
hi link luaTodo VimTodo
" }}}
"----------------------------------------------------------------------
" SynStack() {{{ "
" Kudos: https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}} SynStack() "