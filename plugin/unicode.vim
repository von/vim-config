" Configuration for Unicode/Non-ascii
" Kudos: http://stackoverflow.com/a/16988346

syntax match nonascii "[^\x00-\x7F]"

highlight nonascii guibg=Red gui=bold ctermbg=Red cterm=bold,underline

" Find unicode
" Kudos: http://vim.1045645.n5.nabble.com/highlighting-weird-characters-tp1160262p1160268.html
CommandCabbr unicode norm<space>/[^<space>-~]

" Replace unicode characters with ascii equivalents
" Kudos: http://www.cl.cam.ac.uk/~mgk25/ucs/quotes.html
" Kudos: http://stackoverflow.com/a/2801132/197789
function! UnicodeClean()
  " Left single quote to apostrophe
  call Preserve(":%s/\\%u2018/'/ge")
  " Right single quote to apostrophe
  call Preserve(":%s/\\%u2019/'/ge")
  " Left double quote to nuetral quote
  call Preserve(":%s/\\%u201C/\"/ge")
  " Right double quote to nuetral quote
  call Preserve(":%s/\\%u201D/\"/ge")
endfunction

CommandCabbr uniclean call<space>UnicodeClean()
