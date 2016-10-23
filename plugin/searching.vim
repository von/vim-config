" Searching configuration

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Use n/N to search for next and momentarily highlight it {{{ "
" Kudos: https://www.youtube.com/watch?v=aHm36-na4-4
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

hi WhiteOnRed    ctermfg=white ctermbg=red

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
" }}} Use n/N to search for next and momentarily highlight it "

" Use Tab/S-Tab to jump forward/backward in search hits {{{ "
" Kudos: http://stackoverflow.com/a/40193754/197789

" needed for mapping <Tab> in command-line mode
set wildcharm=<C-z>

cnoremap <expr> <Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "<S-Tab>"
" }}} Use Tab/S-Tab to jump forward/backward in search hits "
