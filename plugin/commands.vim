" My commands and command abbreviations

" Note user commands must start with uppercase letter
" http://vimdoc.sourceforge.net/htmldoc/usr_40.html#40.2

" Command abbreviations are more flexible,
" http://vimdoc.sourceforge.net/htmldoc/map.html#Abbreviations
" Note they take effect anywherein the command (including arguments).
" http://stackoverflow.com/a/3879737/197789

" Close buffer without exiting (uses moll/vim-bbye)
:cabbrev q Bdelete

" Quit all buffers with ':Q'
:cabbrev Q qa

" Redraw with ':R'
:cabbrev R redraw!

" Source current file with ':S'
:cabbrev S source %
