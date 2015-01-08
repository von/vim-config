" Key bindings and related configuration
"
" See also commands.vim
"
" To see key mappings and their source, use ':verbose map'
" Kudos: http://stackoverflow.com/a/7644189/197789
"
" To see default vim key bindings, use ':help index'
" Kudos: http://stackoverflow.com/a/2484137/197789

" Leader bindings {{{ "
" My strategy is to use <leader> for commonly-used one-stroke commands.

" Use space as leader
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" See also unite.vim for <leader>g, <leader>m

" <leader>b opens buffer list in vim-buffergator
:map <leader>b :BuffergatorOpen<cr>

:map <leader>B :Gblame<cr>

" Open file explorer
:map <leader>o :Explore<cr>

" Close buffer without exiting (uses moll/vim-bbye)
:map <leader>q :Bdelete<cr>

" Quit all buffers with 'Q'
:map <leader>Q :qa<cr>

" Redraw with 'R'
:map <leader>R :redraw!<cr>

" Source current file with 'S'
:map <leader>S :source %<cr>:redraw!<cr>

" Toggle ctags
:map <leader>T :TagbarToggle<cr>

" Run tig to do my git stuff
"   silent turns off request for enter when tig is done, that requires
"   refresh supplied by redraw.
:map <leader>t :silent !tig status<cr>:redraw!<cr>

:map <leader>u :GundoToggle<cr>

:map <leader>v :silent !vifm<cr>:redraw!<cr>

" Save with <leader>w
:map <leader>w :w<cr>

" }}} Leader bindings

" Map C-s to back-screen because C-b is used by tmux
" Note this requires terminal to ignore C-s
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
:map <C-s> <C-B>

" Type 12<Enter> to go to line 12
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <CR> G
nnoremap <BS> gg

" Bindings for vim-expand-region {{{

" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}} Bindings for vim-expand-region

" Timeouts {{{ "

" Timeout on mappings and key codes
set timeout ttimeout

" Mapping delay
set timeoutlen=500

" Key code delay
set ttimeoutlen=500

" }}} Timeouts "
