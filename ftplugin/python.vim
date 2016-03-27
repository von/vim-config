"
" Key bindings for python files

" Python configuration: tab inserts 4 spaces
setlocal shiftwidth=4 softtabstop=4

" Have docstrings work as expected with DelimitMate
let b:delimitMate_nesting_quotes = ['"']

" Turn off automatic completion
:NeoCompleteLock

" Run PyLint with <leader>mp
:map <leader>mp :PymodeLint<cr>:redraw!<cr>
