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
  hi CursorLine cterm=None ctermfg=None ctermbg=236  " Medium grey
  hi CursorLineNr cterm=None ctermfg=None ctermbg=236
  if a:mode == 'i'  " Insert mode
    hi CursorLineNr ctermfg=black ctermbg=green
  elseif a:mode == 'r'  " Replace mode
    hi CursorLineNr ctermfg=black ctermbg=blue
  elseif a:mode == 'v'  " Virtual Replace mode (gr/gR)
    hi CursorLineNr ctermfg=black ctermbg=red
  else " Not in insert mode
    hi CursorLineNr ctermfg=yellow
  endif
endfunction

augroup SetCursorLine
  au!
  au InsertEnter * call SetCursorLineColor(v:insertmode)
  au InsertChange * call SetCursorLineColor(v:insertmode)
  au InsertLeave * call SetCursorLineColor("-")
augroup END

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

" Line number for line with cursor
hi CursorLineNr   ctermfg=yellow ctermbg=236

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

" Display an indicator in the 80th column (only when line reaches it)
" Kudos: https://www.youtube.com/watch?v=aHm36-na4-4
augroup SetColorCoumn
  au!
  " For inital Vim window...
  au VimEnter * call matchadd('ColorColumn', '\%80v', 100)
  " ...and each subsequent window.
  au WinNew * call matchadd('ColorColumn', '\%80v', 100)
augroup END

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

hi link shTodo VimTodo
hi link zshTodo VimTodo
hi link luaTodo VimTodo
hi link luaCommentTodo VimTodo
hi link pythonTodo VimTodo
hi link confTodo VimTodo
hi link tmuxTodo VimTodo
hi link perlTodo VimTodo
hi link javaScriptCommentTodo VimTodo
" }}}
"----------------------------------------------------------------------
" Unite {{{ "
hi clear uniteSource__GrepPattern
hi uniteSource__GrepPattern cterm=underline ctermfg=yellow
" }}} Unite "
"----------------------------------------------------------------------
" HTML {{{ "
hi clear htmlItalic
" italic is not currently supported in my setup
" TODO: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
hi htmlItalic ctermfg=grey
" }}} Unite "
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
