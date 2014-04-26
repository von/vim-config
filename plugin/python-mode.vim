" Configuration related to python-mode plugin

" Disable run code plugin
let g:pymode_run = 0

" pylint uses https://github.com/klen/pylama
" Use '# noqa' to skip a line

" Enable pylint checking every save
" Use ':PymodeLint' to run manually
let g:pymode_lint_on_write = 1

" Don't automatically remove unused whitespace
let g:pymode_utils_whitespaces = 0

" Auto jump on first error
let g:pymode_lint_jump = 1

" Don't load rope as it's C-c command interfers with my C-c to close window
let g:pymode_rope = 0

" Rebind from "<leader> b" which conflicts with changing buffers
let g:pymode_breakpoint_bind = "<leader>P"
