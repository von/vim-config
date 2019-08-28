" vimrc (use double quotes for comments)
" Kudos: http://vim.wikia.com/wiki/Example_vimrc
"
" Loads conf/*.vim and after that neobundle.vim
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
" Fix term in tmux {{{
" If we are running in tmux, term will be screen-256color and vim
" works better if term=xterm-256color when running :term
"
if &term == "screen-256color"
  set term=xterm-256color
endif

" }}} Fix term in tmux
"----------------------------------------------------------------------
" Set up ~/.vim-local {{{ "

" Only on startup
if has('vim_starting')
  " Where we store all our local state
  " Keep this in .vimrc as stuff in conf/ relies on it
  silent !mkdir ~/.vim-local > /dev/null 2>&1
endif

" }}} Set up ~/.vim-local "
"----------------------------------------------------------------------
" load conf/*.vim {{{ "

" Use 'source' instead of 'runtime' as the latter loads all matching files
" in 'runtimepath'
" Don't use conf/**/*.vim here as we don't want to load conf/after/*.vim
" yet.
for f in split(glob('~/.vim/conf/*.vim'), '\n')
  exe 'source' f
endfor

" Note that after/plugin/LoadAfterConf.vim will load conf/after/*.vim
" after plugin/*.vim

" }}} load conf/*.vim
"----------------------------------------------------------------------
" Load NeoBundles {{{ "

" Do this after conf/*.vim but before conf/after/*.vim since some
" configuration needs to be run before and some after.
source ~/.vim/neobundle.vim

" }}} Load NeoBundles "
"----------------------------------------------------------------------
" Load man support {{{ "
" Enable the :Man <topic> command
" Use 'runtime!' to load both vim version and my version
" Kudos: http://vim.wikia.com/wiki/View_man_pages_in_Vim
runtime! ftplugin/man.vim
" }}} Load man support "
