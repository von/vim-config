"
" Key bindings for python files

nmap <leader>lint :PymodeLint<cr>

" Next and previous error in location list (pylint errors/warnings)
map ]n :lne<cr>
map [p :lp<cr>

" Python configuration: Use tab inserts 4 spaces
setlocal shiftwidth=4 softtabstop=4

" Have docstrings work as expected with DelimitMate
let b:delimitMate_nesting_quotes = ['"']
