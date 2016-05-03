" Word wrap configuration

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" set formatoptions {{{

" Automatically wrap comments (using textwidth)
set formatoptions+=c

" Automatically insert comment leader on new line
set formatoptions+=r
set formatoptions+=o

" Allow formatting of comments with 'gq'
set formatoptions+=q

" Remove comment leaders when joining lines
set formatoptions+=j

" }}} set formatoptions

" linebreak tells Vim to only wrap at a character in the 'breakat' option
" (Basically, word boundaries, so turn this on for text modes.)
set nolinebreak

" Wrap the current paragraph
CommandCabbr wrap call<space>Preserve(':normal<space>gq}')

" Wrap the whole document
CommandCabbr wrapall call<space>Preserve(':normal<space>gqG')

" Allow for quick turning on and off soft wrapping of long lines
CommandCabbr nowrap setlocal<space>nowrap!

" WrapSoft() {{{ "

" Turn on soft (no insertion of characters) wrapping Kudos:
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks Kudos:
" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
function! WrapSoft()
  " wrap tells Vim to word wrap visually (as opposed to changing the text
  " in the buffer)
  setlocal wrap
  " Disable wrapping and don't wrap when getting close to right margin.
  setlocal textwidth=0
  setlocal wrapmargin=0
  " If you want to keep your existing 'textwidth' settings for most lines in
  " your file, but not have Vim automatically reformat when typing on existing
  " lines, you can do this with:
  setlocal formatoptions-=t
  " Don't wrap lines that are already longer than textwidth before inserting
  " more text.
  setlocal formatoptions+=l
  " Turn off virtualedit, i.e. allowing cursor positioning where there is no
  " actual character (e.g. in tabs, past end of line)
  set virtualedit=
  " Display as much of last line as possible.
  setlocal display+=lastline

  noremap  <buffer> <silent> <Up>   gk
  noremap  <buffer> <silent> <Down> gj
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
  noremap  <buffer> <silent> k gk
  noremap  <buffer> <silent> j gj
  noremap  <buffer> <silent> 0 g0
  noremap  <buffer> <silent> $ g$
endfunction

" }}} WrapSoft() "

" WrapHard() {{{ "

" Turn on hard (insert carriage returns) wrapping
function! WrapHard()
  " Turn off soft wrap
  setlocal nowrap
  " That will automatically wrap text as close to 79 characters as white space
  " allows without exceeding the 79 character limit. This option wraps at word
  " boundaries.
  setlocal formatoptions+=t
  setlocal textwidth=79
  " Wrap lines that are longer than textwidth before lengthening them.
  setlocal formatoptions-=l
endfunction

" }}} WrapHard() "

" WrapOff() {{{ "

" Turn off any wrapping
function! WrapOff()
  setlocal nowrap
  " Don't hard wrap text
  setlocal textwidth=0
  " Don't wrap existing long lines when inserting text.
  setlocal formatoptions+=l
  "  This allows more natural movement between long lines with shorter lines
  "  in between.
  setlocal virtualedit=all
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> <Home>
  silent! nunmap <buffer> <End>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
  silent! iunmap <buffer> <Home>
  silent! iunmap <buffer> <End>
endfunction
" }}} WrapOff() "
