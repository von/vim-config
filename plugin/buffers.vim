" Configuration related to buffers

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Exit if we just closed last buffer
" Kudos: http://superuser.com/a/668612/128341
autocmd BufDelete * if len(filter(range(1, bufnr('$')), 'empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

"----------------------------------------------------------------------
" NextBuffer and PrevBuffer functions {{{

" Step through buffers skipping quickfix buffers
" TODO: make list of buffers to skip configurable
function! NextBuffer()
  execute ":bnext"
  if &buftype ==# 'quickfix'
    execute ":bnext"
  endif
endfunction

function! PrevBuffer()
  execute ":bprev"
  if &buftype ==# 'quickfix'
    execute ":bprev"
  endif
endfunction

" }}} NextBuffer and PrevBuffer functions
"----------------------------------------------------------------------
" Buffer navigation key bindings {{{

" Cycle through tabs with shift-right
nmap <S-Right> :call NextBuffer()<cr>

" Cycle the other way with shift-left
nmap <S-Left> :call PrevBuffer()<cr>

" }}} Buffer navigation key bindings "
"------------------------------------------------------------
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" }}}
