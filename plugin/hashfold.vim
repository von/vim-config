" Fold functions for enabling folds for files using has for comments
"
" Use '#######+" followed by fold title to indicate first-level fold
" Use '######" followed by fold title to indicate second-level fold
" Use '#------+' to close all folds
" Use '#-----' to close second-level fol

function! HashFoldExpr()
  let thisline = getline(v:lnum)
  if match(thisline, '^#\{7,}') >= 0
    return ">1"
  elseif match(thisline, '^#\{6}') >= 0
    return ">2"
  elseif match(thisline, '^#-\{7,}') >= 0
    return "0"
  elseif match(thisline, '^#-\{5}') >= 0
    return "s1"
  else
    return "="
endfunction

function! HashFoldText()
  let titleline = getline(v:foldstart + 1)
  let title = substitute(titleline, '^#\+\s*', '', '')
  let indent = repeat('#', v:foldlevel)
  let foldsize = (v:foldend - v:foldstart)
  let linecount = '['.foldsize.' line'.(foldsize>1?'s':'').']'
  return indent . ' ' . linecount . ' ' . title
endfunction
