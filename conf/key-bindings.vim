
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

" Disable automatic keybinds of bundles {{{ "

" Buffergator
let g:buffergator_suppress_keymaps=1

" }}} Disable automatic keybinds of bundles "

" Leader bindings {{{ "
" My strategy is to use <leader> for commonly-used one-stroke commands.

" Use space as leader
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" Clear highlighted search results
:map <leader><leader> :noh<cr>

" Open menu of tabs
:map <leader><tab> :Unite tab<cr>

" Switch to previous buffer
:map <leader>b :e #<cr>

" Open tab-specific buffer list
:map <leader>B :Unite buffer_tab<cr>

" Comment/uncomment current line or, if active, region
:map <leader>c :Commentary<cr>

" Uncomment current and adjacent lines
:map <leader>C gcu

" Toggle fold open/close
:map <leader>f za

" Open all folds with search results
" Kudos: https://stackoverflow.com/a/18805662/197789
:map <leader>F :g//foldopen<CR>

" <leader>g is grep via unite
nnoremap <silent> <leader>g :Unite grep:.<cr>

" <leader>h is used by git-gutter

" Show highlight group under cursor with <leader>H
" SynStack() from colors.vim
:map <silent> <leader>H :call SynStack()<CR>

" <leader>m is reserved for mode-specific bindings

" vim_markdown_preview: Replace default C-p
let vim_markdown_preview_hotkey='<leader>mP'

" <leader>M toggle Quickmenu
:map <leader>M :call quickmenu#toggle(0)<cr>

" <leader>N toggles NeoComplete
:map <leader>N :NeoCompleteToggle<CR>

" Open file explorer
:map <leader>o :EditVifm<CR>

" Unite file searching
" ProjectDir is the top-level version control directory
" (e.g. where .git/ is)
:nmap <leader>O :UniteWithProjectDir -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>

" Paste from system pastebuffer
:map <leader>p "+p

" Close buffer without exiting (uses moll/vim-bbye)
:map <leader>q :Bdelete<cr>

" Quit all buffers with 'Q'
:map <leader>Q :qa<cr>

" Redraw with 'R'
:map <leader>R :GitGutter<cr>:redraw!<cr>

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
" In visual mode, don't save partial file and restore visual selection.
:vmap <leader>w :<C-U>w<cr>gv

" <leader>W - wrap and whitespace  {{{ "

" Turn on soft wrap
:map <leader>W :call WrapSoft()<cr>

" Re-wrap whole file
:map <leader>Wa gqG

" Clean up whitespace with <leader>W
:map <leader>Wc :clean<cr>

" Turn on hard wrap
:map <leader>Wh :call WrapHard()<cr>

" Turn off word wrapping
:map <leader>Wo :call WrapOff()<cr>

" Re-wrap paragraph
:map <leader>Wp {gq}

" Turn on soft wrap
:map <leader>Ws :call WrapSoft()<cr>

" }}} <leader>W - wrap and whitespace  "

" Yank line to system pastebuffer
" Note yy yanks line including carraige return which will screw up
" passwords! 'g_' is like '$' but without newline.
" Kudos: http://stackoverflow.com/a/20165747/197789
:map <leader>y ^vg_"+y
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
" See also ../ftplugin/qf.vim

" }}} Carriage return

" Plus and minus open and close all folds {{{ "
nnoremap - zM
nnoremap + zR
" }}} Plus and minus open and close folds "

" <,>,= maintain visual selection {{{ "
" Kudos: http://stackoverflow.com/a/3702781/197789
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
" }}}

" Hit Backspace to go to beginning of file.
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <BS> gg

" I don't want to go into Ex mode by accident
nmap Q <nop>

" Remap 0 and $ to for SoftWrap {{{
" Go to first non-whitepace character on line, then first column of line or
" paragraph. Seems to work well for soft-wrapped or unwrapped.
nnoremap <silent> 0 :call ToggleMovement('g^', '0')<CR>
" End of wrapped line, then end of paragraph
nnoremap <silent> $ :call ToggleMovement('g$', '$')<CR>
" }}} Remap 0 and $ to for SoftWrap

" Remap Up/Down to work with soft wrap nicely {{{
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
" }}} Remap Up/Down to work with soft wrap nicely

" Bindings for NeoComplete {{{

" BTW, it is tempting to use escape to cancel Neocomplete menu, but it is part of the
" sequence for arrow keystrokes, so will not have the desired results.

" <Tab> completes NeoComplete popup if Open, otherwise acts normally
inoremap <expr> <Tab> pumvisible() ? neocomplete#close_popup() : "<Tab>"

" <CR> always inserts a <CR>, canceling NeoComplete popup if Open
inoremap <expr> <CR> pumvisible() ? neocomplete#cancel_popup() . "<CR>" : "<CR>"

" }}}

" Bindings for Ultisnips {{{
" Uses <S-Tab> and <C-l>. See ultisnips.vim
" }}} Bindings for Ultisnips

" Normal-mode binginds {{{ "

" C-c in normal mode closes quickfix
nmap <C-C> :cclose<cr>

" }}} Normal-mode binginds "

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

" Visual-mode bindings {{{ "

" Call TwiddleCase on selection
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Bindings for vim-expand-region
" Kudos: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}} Visual-mode bindings "

" Bracket ([,]) bindings {{{ "

" Use vim-qf functions for navigating quickfix
nmap [q <Plug>(qf_qf_previous)
nmap ]q <Plug>(qf_qf_next)

" Find previous unicode character
:map [U ?[^\x00-\x7F]<cr>
" Find next unicode character
:map ]U /[^\x00-\x7F]<cr>

" }}} Bracket ([,]) bindings "

" Map n and N to HLNext() {{{ "
" Find next search match and briefly highlight it.
" The 'zv' opens folds if needed
nnoremap <silent> n   nzv:call HLNext(0.4)<cr>
nnoremap <silent> N   Nzv:call HLNext(0.4)<cr>
" }}} Map n and N to HLNext() "

" T prefix for tab command {{{ "
" Kudos: http://vim.wikia.com/wiki/Alternative_tab_navigation

" Close tab
nnoremap <silent> Tc :tabclose<cr>

" List of tabs
nnoremap <silent> Tl :Unite tab<cr>

" Close tab
nnoremap <silent> Tn :tabnew<cr>

" Last tab
" Kudos: https://superuser.com/a/675119/128341
let g:lasttab = tabpagenr()
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> TT :exe "tabn " . g:lasttab<cr>

" }}} T prefix for tab command "

" Use Tab/S-Tab to jump forward/backward in search hits {{{ "
" Kudos: http://stackoverflow.com/a/40193754/197789
" The 'zv' opens folds if needed

" needed for mapping <Tab> in command-line mode
set wildcharm=<C-z>

cnoremap <expr> <Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>zv/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>zv?<C-r>/" : "<S-Tab>"
" }}} Use Tab/S-Tab to jump forward/backward in search hits "

" Timeouts {{{ "

" Timeout on mappings and key codes
set timeout ttimeout

" Mapping delay
set timeoutlen=500

" Key code delay
set ttimeoutlen=500

" }}} Timeouts "
