" My commands and command abbreviations
" Note user command must start with uppercase letter
" http://vimdoc.sourceforge.net/htmldoc/usr_40.html#40.2
" http://vimdoc.sourceforge.net/htmldoc/map.html#Abbreviations

" Close buffer without exiting (uses moll/vim-bbye)
:cabbrev q Bdelete

" Quit all buffers with ':Q'
:cabbrev Q qa

" Redraw with ':R'
:cabbrev R redraw!
