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
" Unicode/Non-ascii {{{
" Kudos: http://stackoverflow.com/a/16988346
syntax match nonascii "[^\x00-\x7F]"

highlight nonascii guibg=Red gui=bold ctermbg=Red cterm=bold,underline

" Find unicode
" Kudos: javascript: http://vim.1045645.n5.nabble.com/highlighting-weird-characters-tp1160262p1160268.html
map <leader>unicode /[^ -~]<CR> 

" }}}
"----------------------------------------------------------------------
" Key bindings {{{

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    " This make <S-arrow> keys work.
    " Kudos: http://superuser.com/a/402084/128341
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

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
" Persistent undo {{{
" Kudos: http://stackoverflow.com/questions/5700389/using-vims-persistent-undoo

silent !mkdir ~/.vim-local/undo/ > /dev/null 2>&1

set undodir=~/.vim-local/undo/
set undofile

" }}}
"----------------------------------------------------------------------
" Backups {{{

silent !mkdir ~/.vim-local/backups/ > /dev/null 2>&1
set backup " make backup files
set backupdir=~/.vim-local/backups/ " where to put backup files

" }}}
"----------------------------------------------------------------------
" Splitting panes {{{

" Kudos: http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally

" Kudos: http://codeincomplete.com/posts/2011/3/4/my_vimrc_file/
" Split vertically with '|'
map <Bar>   <C-W>v<C-W><Right>
" Split horizontally with '-'
map -       <C-W>s<C-W><Down>
" Close pane control-c
map <C-c>   <C-W>c

" Allow one-keystroke navigation between vi panes and tmux panes
" C-h/j/k/l as expected plus C-\ to switch to last pane
NeoBundle 'christoomey/vim-tmux-navigator'

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
set splitbelow
set splitright

" }}}
"----------------------------------------------------------------------
" Buffer manipulation {{{

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Step through buffers skipping quickfix buffers
" TODO: make list of buffers to skip configurable
function! NextBuffer()
  execute ":bnext"
  if &buftype ==# 'quickfix'
    execute ":bnext"
  endif
endfunction

function! PrevBuffer()
  execute ":bprev"
  if &buftype ==# 'quickfix'
    execute ":bprev"
  endif
endfunction

" Cycle through tabs with shift-right
nmap <S-Right> :call NextBuffer()<cr>

" Cycle the other way with shift-left
nmap <S-Left> :call PrevBuffer()<cr>

" Exit if we just closed last buffer
" Kudos: http://superuser.com/a/668612/128341
autocmd BufDelete * if len(filter(range(1, bufnr('$')), 'empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

" }}}
"----------------------------------------------------------------------
" Customize tabbar {{{
" http://stackoverflow.com/a/7238163/197789
"
" Active label
:hi TabLineSel   guifg=Yellow guibg=DarkBlue gui=bold ctermfg=Yellow ctermbg=DarkBlue cterm=bold,underline
" Inactive labels
:hi TabLine      guifg=White guibg=DarkBlue gui=none ctermfg=White ctermbg=DarkBlue cterm=none
" Remainder of tabbar
:hi TabLineFill  guifg=White guibg=DarkBlue gui=none ctermfg=White ctermbg=DarkBlue cterm=none

" }}}
"----------------------------------------------------------------------
" Sessions {{{

" TODO: Both sessionoptions and viewoptions contain 'options' and I think
"  this causes conflicts, like foldmethod getting lost.

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Save and load session
NeoBundle 'tpope/vim-obsession'

silent !mkdir ~/.vim-local/sessions/ > /dev/null 2>&1
nmap <leader>ss :wa<cr>:Obsession $HOME/.vim-local/sessions/
nmap <leader>ls :wa<cr>:source $HOME/.vim-local/sessions/

" }}}
"----------------------------------------------------------------------
" Misc variables {{{

" Prevents dark fonts
set background=dark

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

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
" Line numbers are blue with dark grey background
hi LineNr         ctermfg=021 ctermbg=234

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
nnoremap <leader>clean mz:1,$s/	/    /ge<cr>:1,$s/\s*$//<cr>:noh<cr>'z

" Re-indent, whole file or selected area
" Kudos: http://vim.wikia.com/wiki/Fix_indentation
nnoremap <leader>indent mzgg=G`z<cr>
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
" Searching {{{

" Highlight search results
set hlsearch

" Clear highlighted search results
map <silent> <leader><cr> :noh<cr>

" Makes search act like search in modern browsers
set incsearch

" }}}
"------------------------------------------------------------
" Word wrap {{{

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" Wrap the current paragraph
" (Uses register z to save and restore location)
nmap <leader>wrap mzgq}'z

" Wrap the whole document
" (Uses register z to save and restore location)
nmap <leader>wrapall mzgqG'z

" Allow for quick turning on and off soft wrapping of long lines
:noremap <leader>nowrap :set nowrap!<CR>

" }}}
"------------------------------------------------------------
" Statusline configuration {{{

NeoBundle 'millermedeiros/vim-statline'

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable fugitive support with statline
let g:statline_fugitive = 1

function! StatusLineInsertEnter(mode)
  " Mode is 'i' for insert, 'r' for replace or 'v' for virtual insert
  " But we are ignoring it

  " Status line colors for pane with focus
  hi StatusLine ctermfg=blue ctermbg=yellow cterm=none

  " Status line colors for panes without focus
  hi StatusLineNC ctermfg=black ctermbg=cyan cterm=none

  " statline colors (linking causes some inverse fields)
  " filename
  hi User1 ctermfg=blue ctermbg=yellow cterm=none
  " flags
  hi User2 ctermfg=blue ctermbg=yellow cterm=none
  " errors
  hi User3 ctermfg=Red ctermbg=yellow cterm=none
  " fugitive
  hi User4 ctermfg=blue ctermbg=yellow cterm=none
endfunction

function! StatusLineInsertLeave(mode)
  " mode as with StatusLineInsertEnter() - again ignored

  " Status line colors for pane with focus
  hi StatusLine ctermfg=blue ctermbg=white cterm=none

  " Status line colors for panes without focus
  hi StatusLineNC ctermfg=black ctermbg=cyan cterm=none

  " statline colors (linking causes some inverse fields)
  " filename
  hi User1 ctermfg=blue ctermbg=white cterm=none
  " flags
  hi User2 ctermfg=blue ctermbg=white cterm=none
  " errors
  hi User3 ctermfg=Red ctermbg=white cterm=none
  " fugitive
  hi User4 ctermfg=blue ctermbg=white cterm=none
endfunction

" set up to change based on being in insert mode
if version >= 700
  au InsertEnter * call StatusLineInsertEnter(v:insertmode)
  au InsertLeave * call StatusLineInsertLeave(v:insertmode)

  " Set up initial colors
  call StatusLineInsertLeave(v:insertmode)
endif

" }}}
"------------------------------------------------------------
" Set title if we are in tmux {{{
" Kudos: http://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system('tmux rename-window vi:' . expand("%"))

" }}}
"------------------------------------------------------------
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

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
" Fugitive configuration {{{

NeoBundle 'tpope/vim-fugitive'

" Delete fugitive buffers when leaving them
" Kudos: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete
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

" Make folds blue on grey (same as line numbers)
hi Folded ctermfg=021 ctermbg=234

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
