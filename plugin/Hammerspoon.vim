" Functions for interacting with Hammerspoon
" Assumes Hammerspoon cli (hs) is installed.
" See: http://www.hammerspoon.org/docs/hs.ipc.html

" Reload my Hammerspoon configuration
function! HammerspoonReload()
  silent execute "!hs -c 'hs.reload()'"
  execute "redraw!"
  echo "Reloading Hammerspoon configuration"
endfunction

" Have Hammerspoon source current file
function! HammerspoonSourceCurrentFile()
  call HammerspoonSourceFile(expand('%:p'))
endfunction

" Have Hammerspoon source given file
function! HammerspoonSourceFile(path)
  silent execute "!hs " . a:path
  execute "redraw!"
  echo "Hammerspoon sourcing " . a:path
endfunction
