" Key bindings and related configuration
"
" To see key mappings and their source, use ':verbose map'
" Kudos: http://stackoverflow.com/a/7644189/197789
"
" To see default vim key bindings, use ':index'
" Kudos: http://stackoverflow.com/a/2484137/197789

" Map C-s to back-screen because C-b is used by tmux
" Note this requires terminal to ignore C-s
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
:map <C-s> <C-B>

" Run tig with T to do my git stuff
"   silent turns off request for enter when tig is done, that requires
"   refresh supplied by redraw.
:map T :silent !tig status<cr>:redraw!<cr>

" Timeouts {{{ "

" Timeout on mappings and key codes
set timeout ttimeout

" Mapping delay
set timeoutlen=500

" Key code delay
set ttimeoutlen=500

" }}} Timeouts "
