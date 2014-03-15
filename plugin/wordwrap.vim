" Word wrap configuration

" Prefix for wrapped lines
" This interfers with cut'n'paste
"set showbreak=↪

" Wrap the current paragraph
cabbrev wrap call Preserve(':normal gq}')

" Wrap the whole document
cabbrev wrapall call Preserve(':normal gqG')

" Allow for quick turning on and off soft wrapping of long lines
cabbrev nowrap :set nowrap!
