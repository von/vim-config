" Configuration for Unicode/Non-ascii
" Kudos: http://stackoverflow.com/a/16988346

" Replace unicode characters with ascii equivalents
" Kudos: http://www.cl.cam.ac.uk/~mgk25/ucs/quotes.html
" Kudos: http://stackoverflow.com/a/2801132/197789
function! UnicodeClean()
  " Left single quote(‘) to apostrophe(')
  call Preserve(":%s/\\%u2018/'/ge")
  " Right single quote(’) to apostrophe(')
  call Preserve(":%s/\\%u2019/'/ge")
  " Left double quote(“) to neutral quote(")
  call Preserve(":%s/\\%u201C/\"/ge")
  " Right double quote(”) to neutral quote(")
  call Preserve(":%s/\\%u201D/\"/ge")
endfunction
