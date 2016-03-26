" Searching configuration

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Momentarily highlight a search term jumped to with n or N
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
