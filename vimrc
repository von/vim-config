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
NeoBundle 'ciaranm/securemodelines'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'

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

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Syntax highlighting
syntax on

" Where we store all our local state
silent !mkdir ~/.vim-local > /dev/null 2>&1

" /bin/sh is an alias for bash
let g:is_bash=1

" }}}
"----------------------------------------------------------------------
" Key bindings {{{

" Map C-r to back-screen because C-b is used by tmux
:map <C-r> <C-B>

" Close buffer without exiting
nnoremap :q :bd<cr>

" Quit all buffers with ':Q'
nnoremap :Q :qa<cr>

" Swap words: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
"     I added the ':noh' to clean up highlighting
" gw: swap with word to right keeping cursor in place
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<cr>
" gl: swap with word to left keeping cursor with word
:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<cr>
" gr: swap with word to right keeping cursor with word
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:noh<cr>

" Run tig with T to do my git stuff
"   silent turns off request for enter when tig is done, that requires
"   refresh supplied by redraw.
:map T :silent !tig status<cr>:redraw!<cr>

" Visual line repeat
" Kudos: https://github.com/nelstrom/dotfiles/blob/master/vimrc 
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" }}}
"----------------------------------------------------------------------
" Misc variables {{{

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

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

" Timeout on mappings and key codes
set timeout ttimeout

" Mapping delay
set timeoutlen=500

" Key code delay
set ttimeoutlen=500

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
" Indentation and whitespace {{{

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=8

" Allow me to turn tabs on and off
nmap <leader>tabs :set noexpandtab<cr>
nmap <leader>notabs :set expandtab<cr>

" Whitespace cleanup
" Convert tabs to 4 spaces, remove trailing whitespace
" (Uses register z to save and restore location)
nnoremap <leader>clean :call Preserve(":1,$s/	/    /ge")<cr>:call Preserve(":1,$s/\s*$//")<cr>

" Re-indent, whole file or selected area
" Kudos: http://vim.wikia.com/wiki/Fix_indentation
nnoremap <leader>indent :call Preserve(":normal gg=G")<cr>
" ALternative to above is use '==' to re-indent current line or selection,
" or '<n>==' (e.g. '5==') to re-indent <n> lines

" Make whitespace visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Allow me to turn off indentation for pasting
" Kudos: http://stackoverflow.com/a/2514520/197789
nmap <leader>paste :set paste<cr>
nmap <leader>nopaste :set nopaste<cr>

" Have < and > keep visual selection active
" Kudos: http://stackoverflow.com/a/3702781/197789
vnoremap < <gv
vnoremap > >gv

" }}}
"------------------------------------------------------------
" Pasting {{{
" Automatically enter and leave paste mode when pasting
" Kudos: https://coderwall.com/p/if9mda

" Note that if you use Vim inside of a Tmux session then you need 
" to double escape the codes in tSI/tEI. 
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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
" Folding {{{

" Save and restore fold state automatically
silent !mkdir ~/.vim-local/views/ > /dev/null 2>&1
set viewdir=~/.vim-local/views/

set viewoptions-=options

" Enable folding for shell scripts
" Value is OR of functions (1), heredoc (2) and if/do/for (4)
let g:sh_fold_enabled = 7 

" Save and load without errors
" Kudos: http://dotfiles.org/~tsukkee/.vimrc
" via: https://ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds/
augroup autoview
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

" Reload without loading view (or any other autocommand)
map <leader>reload :noautocmd e<cr>

" 'F' folds if on fold, else acts normally
" Normally does reverse of 'f'
nnoremap <silent> F za
vnoremap F zf

" Open all folds
map <leader>unfold zR

" Close all folds
map <leader>fold zM

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
