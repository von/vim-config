" Configuration related to whitespace

" Whitespace cleanup
" Convert tabs to 4 spaces, remove trailing whitespace
" (Uses register z to save and restore location)
nnoremap <leader>clean :call Preserve(":1,$s/	/    /ge")<cr>:call Preserve(":1,$s/\s*$//")<cr>

" Make whitespace visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
