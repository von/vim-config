"
" Key bindings for python files

nmap <leader>lint :PymodeLint<cr>

" Next and previous error in location list (pylint errors/warnings)
map ]n :lne<cr>
map [p :lp<cr>
