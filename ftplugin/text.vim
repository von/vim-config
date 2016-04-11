" Turn on spell checking
setlocal spell

" Turn on wordwrap
setlocal textwidth=79

" Break at characters in 'breakat' (word boundaries)
set linebreak

" Wrap current paragraph
:map <leader>mw gqip

" Automatically reformat when text is inserted or deleted
set formatoptions+=a
