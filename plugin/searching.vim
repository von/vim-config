" Searching configuration

" Highlight search results
set hlsearch

" Clear highlighted search results
map <silent> <leader>c :noh<cr>

" Makes search act like search in modern browsers
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Create 'S' object representing last search hit
" Use 'S' instead of 's' due to surround.vim using 's'
" Type yS to copy the search hit.
" Type "+yS to copy the hit to the clipboard.
" Type cS to change the hit.
" Type gUS to convert the hit to uppercase.
" Type vS to visually select the hit. If you type another S you will extend
" the selection to the end of the next hit.
" Kudos: http://vim.wikia.com/wiki/Copy_or_change_search_hit
vnoremap <silent> S //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap S :normal vs<CR>
