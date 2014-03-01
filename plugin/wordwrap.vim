" Word wrap configuration

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" Wrap the current paragraph
" (Uses register z to save and restore location)
nmap <leader>wrap :call Preserve(":normal gq}")<cr>

" Wrap the whole document
" (Uses register z to save and restore location)
nmap <leader>wrapall :call Preserve(":normal gqG")<cr>

" Allow for quick turning on and off soft wrapping of long lines
:noremap <leader>nowrap :set nowrap!<CR>
