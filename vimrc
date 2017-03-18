" vimrc (use double quotes for comments)
" Kudos: http://vim.wikia.com/wiki/Example_vimrc
"
" Loads conf/*.vim
"
" Also see the ftplugins/ directory for filetype-specific stuff:
" http://vim.wikia.com/wiki/keep_your_vimrc_file_clean
"
" And plugins/ for other automatically loaded configuration
" These are loaded after this file.
" http://vimdoc.sourceforge.net/htmldoc/starting.html#initialization
"
" after/plugin/LoadAfterConf.vim will load conf/after/*.vim after plugins/
"
"----------------------------------------------------------------------
" Set up ~/.vim-local {{{ "

" Where we store all our local state
" Keep this in .vimrc as stuff in conf/ relies on it
silent !mkdir ~/.vim-local > /dev/null 2>&1

" }}} Set up ~/.vim-local "
"----------------------------------------------------------------------
" load conf/*.vim {{{ "

" Don't usr conf/**/*.vim here as we don't want to load conf/after/*.vim
" yet.
runtime! conf/*.vim

" Note that after/plugin/LoadAfterConf.vim will load conf/after/*.vim
" after plugin/*.vim

" }}} load conf/*.vim
