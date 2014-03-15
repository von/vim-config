" Configuration related to buffers

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

"----------------------------------------------------------------------
" Buffer navigation key bindings {{{

" Buffers for NextBuffer and PrevBuffer to skip
" It makes sense for this to equal bufferline_exludes
let g:skip_buffers = ['^$']

" Cycle through tabs with shift-right
nmap <S-Right> :call NextBuffer()<cr>

" Cycle the other way with shift-left
nmap <S-Left> :call PrevBuffer()<cr>

" }}} Buffer navigation key bindings "
"------------------------------------------------------------
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
augroup BufEnterLCD
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" }}}
