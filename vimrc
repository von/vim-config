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
" Set up ~/.vim-local {{{ "

" Where we store all our local state
" Keep this in .vimrc as stuff in conf/ relies on it
silent !mkdir ~/.vim-local > /dev/null 2>&1

" }}} Set up ~/.vim-local "
"----------------------------------------------------------------------
" Options {{{

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Syntax highlighting
syntax on

" Make whitespace visible
set list listchars=tab:⋅⋅,trail:⋅,nbsp:⋅

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" set formatoptions {{{

" Automatically wrap comments (using textwidth)
set formatoptions+=c

" Automatically insert comment leader on new line
set formatoptions+=r
set formatoptions+=o

" Allow formatting of comments with 'gq'
set formatoptions+=q

" Remove comment leaders when joining lines
set formatoptions+=j

" }}} set formatoptions

" linebreak tells Vim to only wrap at a character in the 'breakat' option
" (Basically, word boundaries, so turn this on for text modes.)
set nolinebreak

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

" Do not have git-gutter highlight lines
let g:gitgutter_highlight_lines = 0

" Display an indicator in the 80th column (only when line reaches it)
" Kudos: https://www.youtube.com/watch?v=aHm36-na4-4
call matchadd('ColorColumn', '\%80v', 100)

" Keep this many lines on screen past cursor when scrolling
set scrolloff=5

" Look for tags in current directory or parent (and on up)
" Use C-] to jump to tag under cursor
set tags=./tags;/

" Enable use of the mouse for all modes
set mouse=a

" Don't use Mac system clipboard by default
"   It can be accessed through '+' - e.g. "+yy or "+pp
" Set clipboard to "unnamed" to make system the default per:
"   http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
set clipboard="none"

" Use blowfish instead of zip with vim's native encryption (see ':X')
set cryptmethod=blowfish

" Don't give me an error if a swapfile is present when editing a file
" Kudos: http://stackoverflow.com/a/1588848/197789
set shortmess+=A

" Automatically read a file if it has changed
set autoread

" }}}
"----------------------------------------------------------------------
" load conf/*.vim {{{ "

" Don't usr conf/**/*.vim here as we don't want to load conf/after/*.vim
" yet.
runtime! conf/*.vim

" Note that after/plugin/LoadAfterConf.vim will load conf/after/*.vim
" after plugin/*.vim

" }}} load conf/*.vim
