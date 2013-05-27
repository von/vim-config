" vimrc (use doube quotes for comments)
" Kudos: http://vim.wikia.com/wiki/Example_vimrc
"
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

" Bring up file explorer with ';'
:map ; :NERDTreeToggle<cr>

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

" Allow one-keystroke navigation between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
set splitbelow
set splitright

" }}}
"----------------------------------------------------------------------
" Tab manipulation {{{
" Kudos:
" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
" http://www.linux.com/learn/tutorials/442422-vim-tips-using-tabs
" http://www.techrepublic.com/blog/opensource/use-tabs-to-open-multiple-files-in-vim/678
" http://vim.wikia.com/wiki/Alternative_tab_navigation

" Tear a pane out into a tab
map T <C-W>T
" Create a new empty tab
map <C-S-T> :tabnew<cr>
nmap <leader>t :tabnew

" Cycle through tabs with tab
map <Tab>   :tabnext<cr>
" Cycle the other way with shift-tab
map <Esc>[Z :tabprevious<cr>

" Customize tabbar
" http://stackoverflow.com/a/7238163/197789
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
" Uses obession.vim: https://github.com/tpope/vim-obsession
silent !mkdir ~/.vim-local/sessions/ > /dev/null 2>&1
nmap <leader>ss :wa<cr>:Obsession $HOME/.vim-local/sessions/
nmap <leader>ls :wa<cr>:source $HOME/.vim-local/sessions/

" }}}
"----------------------------------------------------------------------
" Misc variables {{{

" Prefix for wrapped lines
set showbreak=↪

" Prevents dark fonts
set background=dark

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

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

" Enable use of the mouse for all modes
" Disabled because it interfers with cut'n'paste.
"set mouse=a

" Display line numbers on the left
set nonumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Keep this many lines on screen past cursor when scrolling
set scrolloff=5

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

" Whitespace cleanup
" Convert tabs to 4 spaces, remove trailing whitespace
nmap <leader>clean :1,$s/	/    /<cr>:1,$s/\s*$//<cr>

" Re-indent, whole file or selected area
" Kudos: http://vim.wikia.com/wiki/Fix_indentation
nmap <leader>indent mzgg=G`z<cr>

" Make whitespace visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Allow me to turn off indentation for pasting
" Kudos: http://stackoverflow.com/a/2514520/197789
nmap <leader>paste :set paste<cr>
nmap <leader>nopaste :set nopaste<cr>

" }}}
"------------------------------------------------------------
" Statusline configuration {{{

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
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" }}}
"------------------------------------------------------------
" Allow for reload of vimrc {{{

nmap <leader>vimrc :source $MYVIMRC<cr>

" }}}
"------------------------------------------------------------
" Pathogen package manager {{{
" https://github.com/tpope/vim-pathogen
call pathogen#infect()
call pathogen#helptags()

" }}}
"------------------------------------------------------------
" NERDTree configuration {{{
" :help NERD_tree.txt

let NERDTreeIgnore=['\.pyc', '\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" Enter NERDTree automatically if no files given on commandline
" Note this handles if vim is started with a session (-S) as well
" Kudos: http://stackoverflow.com/a/15846999/197789
autocmd vimenter * if bufname("%") == "" | NERDTree | endif

" }}}
"------------------------------------------------------------
" Fugitive configuration {{{

" Delete fugitive buffers when leaving them
" Kudos: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
"------------------------------------------------------------
" Folding {{{

" vimrc uses markers
au FileType vim setlocal foldmethod=marker

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

" Spaces folds if on fold, else acts normally
nnoremap <silent> <Space> za
vnoremap <Space> zf

" }}}
"------------------------------------------------------------
" Filetypes {{{

" python {{{

" Python configuration: Use tab inserts 4 spaces
au FileType python setlocal shiftwidth=4 softtabstop=4

" TODO: http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide

" }}}

" GIT commits {{{

" Disable modelines in GIT commits to parsing commit messages with
" 'git --amend'
" Kudos: http://www.dreamind.de/cgi-bin/gitweb.cgi?p=configurations.git;a=commitdiff_plain;h=8bfd2c81b8bbcf79dec9771daf7ac2cb57fe12ce
autocmd BufRead */.git/COMMIT_EDITMSG setl nomodeline

" Disable saving/loading views for GIT commits
autocmd BufRead */.git/COMMIT_EDITMSG autocmd! autoview

" }}}

" Shell {{{ "

au FileType sh setlocal foldmethod=syntax

" }}} Shell  "

" }}}
