" Configuration related to buffers

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" BufferGator sort by filename instead of buffer number
let g:buffergator_sort_regime = 'basename'

"------------------------------------------------------------
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
augroup BufEnterLCD
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" }}}
