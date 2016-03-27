" statusline configuration (via airline)
" Source this and then use AirlineRefresh to reload

" Always display the status line, even if only one window is displayed
set laststatus=2

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Enable fugitive support with statline
let g:statline_fugitive = 1

" Show whitespace errors
let g:airline#extensions#whitespace#enabled = 1

" Set airline theme
" Kudos: http://choorucode.com/2015/03/18/how-to-use-themes-in-airline/
let g:airline_theme='vonairlinetheme'

" {{{ Use unicode symbols in airline
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
"}}}

" {{{ tabline configuration

" Turn on enhanced tabline
let g:airline#extensions#tabline#enabled = 1

" The `unique_tail_improved` - another algorithm, that will smartly uniquify
" buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" {{{ Clean up tabline
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" }}}

" {{{ Index buffers in tabline and add keybindings
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" }}}
" }}}
