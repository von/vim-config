" Configuration related to buffers

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

"----------------------------------------------------------------------
" Buffers for NextBuffer and PrevBuffer to skip
" It makes sense for this to equal bufferline_exludes
let g:skip_buffers = ['^$']

"----------------------------------------------------------------------
" BufferChangeWithSkip, NextBuffer and PrevBuffer functions {{{

" Execute a:cmd until we hit buffer not skip_buffers
function! BufferChangeWithSkip(cmd)
  let l:starting_bufnr = bufnr("%")
  while 1
    try
      execute a:cmd
    catch /E85:/
      echo "No other buffer to visit"
      break
    endtry
    if l:starting_bufnr == bufnr("%")
      " Looped back around to the start
      echo "No other buffer to visit"
      break
    endif
    for ex in g:skip_buffers
      echo "Checking match with " . ex . " and " . bufname("%")
      if match(bufname("%"), ex) > -1
        continue
      endif
    endfor
    " Successfully changed to buffer that didn't match
    break
  endwhile
endfunction

" Go to next buffer not on in skip_buffers
function! NextBuffer()
  call BufferChangeWithSkip(":bnext")
endfunction

" Go to previous buffer not on in skip_buffers
function! PrevBuffer()
  call BufferChangeWithSkip(":bprev")
endfunction

" }}} BufferChangeWithSkip, NextBuffer and PrevBuffer functions
"----------------------------------------------------------------------
" Buffer navigation key bindings {{{

" Cycle through tabs with shift-right
nmap <S-Right> :call NextBuffer()<cr>

" Cycle the other way with shift-left
nmap <S-Left> :call PrevBuffer()<cr>

" }}} Buffer navigation key bindings "
"------------------------------------------------------------
" Make current directory the one holding the current file {{{
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
augroup BufEnterLCD
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" }}}
