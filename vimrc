" vimrc (use double quotes for comments)
" Kudos: http://vim.wikia.com/wiki/Example_vimrc
"
" Also see the ftplugins/ directory for filetype-specific stuff:
" http://vim.wikia.com/wiki/keep_your_vimrc_file_clean
"
" And plugins/ for other automatically loaded configuration
" These are loaded after this file.
" http://vimdoc.sourceforge.net/htmldoc/starting.html#initialization
"
" Assumes 256 colors:
" http://vim.wikia.com/wiki/256_colors_in_vim
"
"----------------------------------------------------------------------
" NeoBundle setup {{{
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

call neobundle#begin(g:pluginInstallDir)

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
" Load Bundles {{{
"
" Note that bundles apparently need to be in vimrc (as opposed to
" in a plugin).

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'danro/rename.vim'
NeoBundle 'kien/ctrlp.vim'

" Allow one-keystroke navigation between vi panes and tmux panes
" C-h/j/k/l as expected plus C-\ to switch to last pane
NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'ciaranm/securemodelines'

let g:buffergator_suppress_keymaps=1  " Do this in key-bindings.vim
NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle 'kana/vim-scratch'

" Allows definiton of arbitrary objects (prereusite of following)
NeoBundle 'kana/vim-textobj-user'
" vim-textobj-entire adds text object of 'ae' for entire buffer
" ('ie' excludes leading and trailing whitespace)
NeoBundle 'kana/vim-textobj-entire'

NeoBundle 'klen/python-mode'

" Following requires ctags-exuberant from ctags.sourceforge.net
"   (On mac: brew install ctags-exuberant)
NeoBundle 'majutsushi/tagbar'

NeoBundle 'millermedeiros/vim-statline'
NeoBundle 'moll/vim-bbye'  " For BDelete
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'  " Snippets for ultisnips
NeoBundle 'sjl/gundo.vim'
NeoBundle 'surround.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rsi' " readline-like key bindings in insert mode
NeoBundle 'mhinz/vim-startify'
NeoBundle 'tpope/vim-unimpaired'

call neobundle#end()

" }}} Misc Bundles
"------------------------------------------------------------
" NeoBundleCheck {{{

" Installation check.
NeoBundleCheck

" }}} NeoBundleCheck
"----------------------------------------------------------------------
" Set up ~/.vim-local {{{ "

" Where we store all our local state
silent !mkdir ~/.vim-local > /dev/null 2>&1

" }}} Set up ~/.vim-local "
"----------------------------------------------------------------------
" Options {{{

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Syntax highlighting
syntax on

" /bin/sh is an alias for bash
let g:is_bash=1

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Show matching bracket when closing
set showmatch

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display line numbers on the left
set number

" Do not have git-gutten highlight lines
let g:gitgutter_highlight_lines = 0

" Display an indicator in the 80th column
set colorcolumn=80

" Keep this many lines on screen past cursor when scrolling
set scrolloff=5

" Look for tags in current directory or parent (and on up)
" Use C-] to jump to tag under cursor
set tags=./tags;/

" Enable use of the mouse for all modes
set mouse=a

" Use Mac system clipboard
" Kudos: http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
set clipboard=unnamed

" Use blowfish instead of zip with vim's native encryption (see ':X')
set cryptmethod=blowfish

" }}}
"----------------------------------------------------------------------
" Turn off bell and visual bell {{{ "

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" }}} Turn off bell and visual bell "
"------------------------------------------------------------
" startify configuration {{{
" See plugin/sessions.vim for startify session configuration

let g:startify_list_order = [
  \ ['Sessions'],
  \ 'sessions',
  \ ['Recent files'],
  \ 'files',
  \ ['Recent files in current directory'],
  \ 'dir',
  \ ['Bookmarks'],
  \ 'bookmarks',
  \ ]

" }}}
