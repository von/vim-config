" ftplugin for python mode

" Python configuration: tab inserts 4 spaces
setlocal shiftwidth=4 softtabstop=4

" Have docstrings work as expected with DelimitMate
let b:delimitMate_nesting_quotes = ['"']

" Turn off automatic completion as its too distracting.
:NeoCompleteLock

" Run PyLint with <leader>mp
:map <leader>mp :PymodeLint<cr>:redraw!<cr>
