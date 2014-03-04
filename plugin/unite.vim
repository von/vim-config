" Unite plugin configuration

" Replace ctrlp functionality
" Hmmm some files seem to be missing, so continue using ctrp for now.
" nnoremap <C-p> :Unite -buffer-name=files -start-insert file_rec/async<cr>

" Allow for buffer switching
nnoremap <leader>buf :Unite -quick-match buffer<cr>

" grep interface
nnoremap <leader>grep :Unite grep:.<cr>
