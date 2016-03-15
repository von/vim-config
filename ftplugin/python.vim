"
" Key bindings for python files

nmap <leader>lint :PymodeLint<cr>

" Python configuration: Use tab inserts 4 spaces
setlocal shiftwidth=4 softtabstop=4

" Have docstrings work as expected with DelimitMate
let b:delimitMate_nesting_quotes = ['"']

" Turn off automatic completion
:NeoCompleteLock
