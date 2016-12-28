
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

" Clear highlighted search results
:map <leader><leader> :noh<cr>

" Switch to previous buffer
:map <leader>b :e #<cr>

" Open buffer list in vim-buffergator
:map <leader>B :BuffergatorOpen<cr>

" Comment/uncomment current line or, if active, region
:map <leader>c :Commentary<cr>

" Uncomment current and adjacent lines
:map <leader>C gcu

" Toggle fold open/close
:map <leader>f za

" <leader>g is grep via unite
nnoremap <silent> <leader>g :Unite grep:.<cr>

" <leader>h is used by git-gutter

" Show highlight group under cursor with <leader>H
" SynStack() from colors.vim
:map <silent> <leader>H :call SynStack()<CR>

" <leader>m is reserved for mode-specific bindings

" Open file explorer
:map <leader>o :EditVifm<CR>

" Paste from system pastebuffer
:map <leader>p "+p

" Close buffer without exiting (uses moll/vim-bbye)
:map <leader>q :Bdelete<cr>

" Quit all buffers with 'Q'
:map <leader>Q :qa<cr>

" Show YankRing with 'r'
:map <leader>r :YRShow<cr>

" Redraw with 'R'
:map <leader>R :redraw!<cr>

" Open a scratch buffer with 's'
:map <leader>s :call ToggleScratch()<CR>

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

" Clean up whitespace with <leader>W
:map <leader>W :clean<cr>

" Yank line to system pastebuffer
:map <leader>y "+yy
" In visual mode, yank block
:vnoremap <leader>y "+y

" Yank file to system pastebuffer
:map <leader>Y :%y+<cr>

" Close all folds with <leader>z
:map <leader>z zM

" Open all folds with <leader>Z
:map <leader>Z zR

" Window manipulation {{{ "
"
" Kudos: http://codeincomplete.com/posts/2011/3/4/my_vimrc_file/

" Don't open file explorer with splits since I'm more likely to be doing a
" split to get two views on the current file.

" Split vertically with '|'
map <leader><Bar>   :vsplit %<cr>

" Split horizontally with '-'
map <leader>-       :split %<cr>

" Window resizing
nnoremap <silent> <Leader><Up> <C-W>-
nnoremap <silent> <Leader><Down> <C-W>+
nnoremap <silent> <Leader><Right> <C-W>>
nnoremap <silent> <Leader><Left> <C-W><
" Balance windows
nnoremap <silent> <Leader>= <C-W>=

" Toggle Maximizing current window (uses ZoomWin)
" Note that mapping to '<C-W>o' here doesn't work for some reason.
nnoremap <silent> <Leader><CR> :silent call ZoomWin#ZoomWin()<CR>

" Make current window 80 columns wide (including lines numbers)
" Kudos: http://stackoverflow.com/a/16110704
" Note <gt> doesn't seem to work here, so use '>'
nnoremap <silent> <Leader>> 83<C-W><Bar>

" }}} Window manipulation
" }}} Leader bindings

" Control characters {{{ "

" File searching with <leader>C-p via unite
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>

" Map C-s to back-screen because C-b is used by tmux
" Note this requires terminal to ignore C-s
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
:map <C-s> <C-B>

" Control characters }}}

" {{{ Carriage return
" Type 12<Enter> to go to line 12
" Hit Enter to go to end of file.
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <CR> G

" Let me use <CR> as normal in quickfix to jump to things
" Kudos: http://stackoverflow.com/a/11983449/197789
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" }}} Carriage return

" Plus and minus open and close all folds {{{ "
nnoremap - zM
nnoremap + zR
" }}} Plus and minus open and close folds "

" Hit Backspace to go to beginning of file.
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <BS> gg

" I don't want to go into Ex mode by accident
nmap Q <nop>

" 0 toggles between first column and first non-empty column
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" Bindings for vim-expand-region {{{

" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}} Bindings for vim-expand-region

" Bindings for NeoComplete/UltiSnips {{{

" Note <Tab> and <C-Tab> are bound to Ultisnips in ultisnips.vim

" Shift-Tab either expands NeoComplete if its menu is open or Expands
" a snippet. This allows hitting S-TAB twice to select and expand a snippet.
" Kudos: https://github.com/SirVer/ultisnips/issues/376#issuecomment-55326568
inoremap <expr> <S-TAB> pumvisible() ? neocomplete#close_popup() : "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"

" <CR> cancels NeoComplete popup if open
inoremap <expr> <CR> pumvisible() ? neocomplete#cancel_popup() . "<CR>" : "<CR>"

" }}}

" Insert-mode bindings {{{

" Make Control-C behave like Escape for exiting insert mode.
" Normally C-c does not check for abbreviations or trigger the |InsertLeave|
" autocommand event. (See :help i_CTRL-C)
inoremap <C-C> <Esc>
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
