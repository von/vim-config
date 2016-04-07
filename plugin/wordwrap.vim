" Word wrap configuration

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" Wrap the current paragraph
CommandCabbr wrap call<space>Preserve(':normal<space>gq}')

" Wrap the whole document
CommandCabbr wrapall call<space>Preserve(':normal<space>gqG')

" Allow for quick turning on and off soft wrapping of long lines
CommandCabbr nowrap setlocal<space>nowrap!
