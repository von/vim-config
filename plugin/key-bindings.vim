" Key bindings and related configuration

" Map C-r to back-screen because C-b is used by tmux
:map <C-r> <C-B>

" Close buffer without exiting
nnoremap :q :bd<cr>

" Quit all buffers with ':Q'
nnoremap :Q :qa<cr>

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
