" Swap words: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
"     I added the ':noh' to clean up highlighting

" gw: swap with word to right keeping cursor in place
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<cr>

" gl: swap with word to left keeping cursor with word
:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<cr>

" gr: swap with word to right keeping cursor with word
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:noh<cr>
