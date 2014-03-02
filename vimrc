" vimrc (use doube quotes for comments)
" Kudos: http://vim.wikia.com/wiki/Example_vimrc
"
" Also see the ftplugins/ directory for filetype-specific stuff:
" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
"
" Assumes 256 colors:
" http://vim.wikia.com/wiki/256_colors_in_vim
"
"----------------------------------------------------------------------
" NeoBundle {{{
"
" First time run ':NeoBundleInstall' to install bundles
" Then run ':NeoBundleUpdate' to update.

" Use ~/.vim-bundle to keep bundles out of git repo
" This is needed in part because YCM used submodules
let g:pluginInstallDir = expand('~/.vim-bundle')

let s:neobundleDir = g:pluginInstallDir . '/neobundle.vim'

" Clone neobundle if not present
" Kudos: https://bitbucket.org/slimane/vimlabo/wiki/.vimrc.neobundle

if !isdirectory(g:pluginInstallDir)
  execute 'silent! mkdir -p ' . g:pluginInstallDir
endif

if !isdirectory(s:neobundleDir) && executable('git')
  execute 'silent ! git clone https://github.com/Shougo/neobundle.vim ' . s:neobundleDir
endif

if has('vim_starting')
  execute 'set runtimepath+=' . s:neobundleDir
endif

call neobundle#rc(g:pluginInstallDir)

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Allow async command running for autocompletion
" Kudos: https://github.com/joedicastro/dotfiles/blob/master/vim/vimrc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" }}} NeoBundle
"----------------------------------------------------------------------
" Misc Bundles {{{

NeoBundle 'kien/ctrlp.vim'
" Allow one-keystroke navigation between vi panes and tmux panes
" C-h/j/k/l as expected plus C-\ to switch to last pane
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ciaranm/securemodelines'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-obsession'

" Allows definiton of arbitrary objects (prereusite of following)
NeoBundle 'kana/vim-textobj-user'
" vim-textobj-entire adds text object of 'ae' for entire buffer
" ('ie' excludes leading and trailing whitespace)
NeoBundle 'kana/vim-textobj-entire'

NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Note you need to build this after initial install
" cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
" For Ubuntu, prefix with:
" export EXTRA_CMAKE_ARGS=-DPYTHON_LIBRARY=/usr/lib/python2.7/config-i386-linux-gnu/libpthon2.7.so
NeoBundle 'Valloric/YouCompleteMe'

" Rebind YouCompleteMe to avoid conflict with Tab used by Ultisnips
" It's tempting to use C-tab here, but iTerm grabs it.
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']

NeoBundle 'kana/vim-scratch'
map <leader>scr :ScratchOpen<cr>
" Open scratch buffer automatically if no files given on commandline
" Note this handles if vim is started with a session (-S) as well
" Kudos: http://stackoverflow.com/a/15846999/197789
autocmd vimenter * if bufname("%") == "" | ScratchOpen | endif

" }}} Misc Bundles
"----------------------------------------------------------------------
" Bufferline {{{
NeoBundle 'bling/vim-bufferline'

" scrolling with fixed current buffer position
let g:bufferline_rotate = 1

" Buffers to exclude.
" Quickfix buffers have no title ('^$')
let g:bufferline_excludes = ['^$']

" }}} Bufferline
"----------------------------------------------------------------------
" Unite {{{

NeoBundle 'Shougo/unite.vim'

" Replace ctrlp functionality
" Hmmm some files seem to be missing, so continue using ctrp for now.
" nnoremap <C-p> :Unite -buffer-name=files -start-insert file_rec/async<cr>

" Allow for buffer switching
nnoremap <leader>buf :Unite -quick-match buffer<cr>

" grep interface
nnoremap <leader>grep :Unite grep:.<cr>

" }}} Unite
"----------------------------------------------------------------------
" Tags {{{
" Use C-] to jump to tag under cursor

" Following request ctags-exuberant from ctags.sourceforge.net
"   (On mac: brew install ctags-exuberant)
NeoBundle 'majutsushi/tagbar'

" Look for tags in current directory or parent (and on up)
set tags=./tags;/

" }}}
"----------------------------------------------------------------------
" High-level options {{{

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Syntax highlighting
syntax on

" Where we store all our local state
silent !mkdir ~/.vim-local > /dev/null 2>&1

" /bin/sh is an alias for bash
let g:is_bash=1

" }}}
"----------------------------------------------------------------------
" Misc variables {{{

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Display line numbers on the left
set number

" Keep this many lines on screen past cursor when scrolling
set scrolloff=5

" }}}
"------------------------------------------------------------
" Mouse configuration {{{

" Enable use of the mouse for all modes
set mouse=a

" Use Mac system clipboard
" Kudos: http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
set clipboard=unnamed

" }}}
"------------------------------------------------------------
" Cursor {{{
" Set cursor for inset and normal mode in tmux
" Kudos: https://gist.github.com/andyfowler/1195581

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Not that after changing back to normal mode, because <Esc> has
" other bindings, one has to press another key before the change
" completes or wait for ttimeoutlen to pass.
"
" }}}
"------------------------------------------------------------
" Statusline configuration {{{

NeoBundle 'millermedeiros/vim-statline'

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable fugitive support with statline
let g:statline_fugitive = 1

" }}}
"------------------------------------------------------------
" Set title if we are in tmux {{{
" Kudos: http://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system('tmux rename-window vi:' . expand("%"))

" }}}
"------------------------------------------------------------
" Allow for reload of vimrc {{{

nmap <leader>vimrc :source $MYVIMRC<cr>

" }}}
"------------------------------------------------------------
" NERDTree configuration {{{
" :help NERD_tree.txt

NeoBundle 'scrooloose/nerdtree'

let NERDTreeIgnore=['\.pyc', '\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" }}}
"------------------------------------------------------------
" python-mode {{{

NeoBundle 'klen/python-mode'

" Disable run code plugin
let g:pymode_run = 0

" pylint uses https://github.com/klen/pylama
" Use '# noqa' to skip a line

" Enable pylint checking every save
" Use ':PymodeLint' to run manually
let g:pymode_lint_on_write = 1

" Don't automatically remove unused whitespace
let g:pymode_utils_whitespaces = 0

" Auto jump on first error
let g:pymode_lint_jump = 1

" Don't load rope as it's C-c command interfers with my C-c to close window
let g:pymode_rope = 0

" }}}
"------------------------------------------------------------
" NeoBundleCheck {{{

" Installation check.
NeoBundleCheck

" }}} NeoBundleCheck
