" Set up for password-store temporary files

" Don't save anything
setlocal noswapfile
setlocal noundofile

" Don't do parentheses matching
setlocal noshowmatch
NoMatchParen

" Turn off spell checking
setlocal nospell

" And turn off wordwrap
call WrapOff()
