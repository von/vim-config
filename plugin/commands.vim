" My commands and command abbreviations

" Note user commands must start with uppercase letter
" http://vimdoc.sourceforge.net/htmldoc/usr_40.html#40.2

" Command abbreviations are more flexible,
" http://vimdoc.sourceforge.net/htmldoc/map.html#Abbreviations
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
" Note they take effect anywherein the command (including arguments).
" http://stackoverflow.com/a/3879737/197789

:command VIMRC :call ReloadVIMRC()
