" Configuration for Unicode/Non-ascii
" Kudos: http://stackoverflow.com/a/16988346

syntax match nonascii "[^\x00-\x7F]"

highlight nonascii guibg=Red gui=bold ctermbg=Red cterm=bold,underline

" Find unicode
" Kudos: javascript: http://vim.1045645.n5.nabble.com/highlighting-weird-characters-tp1160262p1160268.html
map <leader>unicode /[^ -~]<CR> 
