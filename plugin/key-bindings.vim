" Key bindings and related configuration
"
" See also commands.vim
"
" To see key mappings and their source, use ':verbose map'
" Kudos: http://stackoverflow.com/a/7644189/197789
"
" To see default vim key bindings, use ':help index'
" Kudos: http://stackoverflow.com/a/2484137/197789

" Note that vim-tmux-navigator uses the following keybindings:
" C-h, C-l, C-j, C-k, C-\

" Leader bindings {{{ "
" My strategy is to use <leader> for commonly-used one-stroke commands.

" Use space as leader
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" See also unite.vim for <leader>g, <leader>m

" Switch to previous buffer
:map <leader>b :e #<cr>

" Open buffer list in vim-buffergator
:map <leader>B :BuffergatorOpen<cr>

" Clear highlighted search results
:map <leader>c :noh<cr>

:map <leader>C :NeoCompleteToggle<cr>

" Toggle fold open/close
:map <leader>f za

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

" Run tig to do my git stuff
"   silent turns off request for enter when tig is done, that requires
"   refresh supplied by redraw.
"   Call to GitGutter refreshes its symbols.
:map <leader>t :silent !tig status<cr>:GitGutter<cr>:redraw!<cr>

" Toggle ctags
:map <leader>T :TagbarToggle<cr>

:map <leader>u :GundoToggle<cr>

:map <leader>v :silent !vifm<cr>:redraw!<cr>

" Save with <leader>w
:map <leader>w :w<cr>

" Close all folds with <leader>z
:map <leader>z zM

" Open all folds with <leader>Z
:map <leader>Z zR

" Window resizing
nnoremap <silent> <Leader><Up> <C-W>-
nnoremap <silent> <Leader><Down> <C-W>+
nnoremap <silent> <Leader><Right> <C-W>>
nnoremap <silent> <Leader><Left> <C-W><
" Balance windows
nnoremap <silent> <Leader>= <C-W>=
" Maximize current window
nnoremap <silent> <Leader><CR> <C-W>_<C-W><Bar>


" }}} Leader bindings

" Window splitting {{{ "
"
" Kudos: http://codeincomplete.com/posts/2011/3/4/my_vimrc_file/
" Split vertically with '|' and open file explorer
map <Bar>   :vsplit .<cr>

" Split horizontally with '-'
" Don't open file explorer since I'm more likely to be doing a horizontal
" split to get two views on the current file.
map -       <C-W>s<C-W><Down>

" }}} Window splitting

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

" Let be use <CR> as normal in quickfix to jump to things
" Kudos: http://stackoverflow.com/a/11983449/197789
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" I don't want to go into Ex mode by accident
nmap Q <nop>

" Bindings for vim-expand-region {{{

" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}} Bindings for vim-expand-region

" Bindings for NeoComplete/UltiSnips {{{

" Note <tab> is bound to Ultisnips in ultisnips.vim

" Shift-Tab either expands NeoComplete if its menu is open or Expands
" a snippet. This allows hitting S-TAB twice to select and expand a snippet.
" Kudos: https://github.com/SirVer/ultisnips/issues/376#issuecomment-55326568
inoremap <expr> <S-TAB> pumvisible() ? neocomplete#close_popup() : "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"

" <CR> cancels NeoComplete popup if open
inoremap <expr> <CR> pumvisible() ? neocomplete#cancel_popup() . "<CR>" : "<CR>"

" }}}

" Command-mode bindings {{{

" Allow use of semi-colon to enter command mode
" Kudos: http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html
nnoremap ; :

" Run a command with '!'
" Kudos: http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html
nnoremap ! :!

cnoremap <C-K> <C-E><C-U>
cnoremap <C-U> <C-E><C-U>

" }}}

" Timeouts {{{ "

" Timeout on mappings and key codes
set timeout ttimeout

" Mapping delay
set timeoutlen=500

" Key code delay
set ttimeoutlen=500

" }}} Timeouts "
