" My commands and command abbreviations

" Note user commands must start with uppercase letter
" http://vimdoc.sourceforge.net/htmldoc/usr_40.html#40.2

" Command abbreviations (cabber and CommandCabbr wrapper) are more flexible,
" http://vimdoc.sourceforge.net/htmldoc/map.html#Abbreviations
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
" Note they take effect anywherein the command (including arguments).
" http://stackoverflow.com/a/3879737/197789

" Use CommandCabbr on itself to define a simpler abbreviation
CommandCabbr ccab CommandCabbr

" Clean up whitespace in file
CommandCabbr clean call<space>WhitespaceClean()

" Allow for quick turning on and off soft wrapping of long lines
CommandCabbr nowrap setlocal<space>nowrap!

" Restore ':p' for previous buffer
CommandCabbr p prev

" Convert unicode to standard character equivalents
CommandCabbr uniclean call<space>UnicodeClean()

CommandCabbr vimrc call<space>ReloadVIMRC()

" Wrap the current paragraph
CommandCabbr wrap call<space>Preserve(':normal<space>gq}')

" Wrap the whole document
CommandCabbr wrapall call<space>Preserve(':normal<space>gqG')

