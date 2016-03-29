" Session configuration

" Note that having an option in both sessionsoptions and viewoptions seems
" to cause problems. Right now I'm trying to remove them from viewoptions.
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,
  \options,resize,tabpages,winsize,winpos

let g:startify_session_dir = '~/.vim-local/sessions'
silent !mkdir ~/.vim-local/sessions > /dev/null 2>&1

" Automatically save sessions when leaving vim or loading another session
let g:startify_session_persistence = 1

" SInit(): Create or load a session {{{ "
" Intended to be used as: vi -c 'call SInit("mysession")'
function! SInit(sessionName)
  let sessionFile = expand(g:startify_session_dir . "/" . a:sessionName)
   if filereadable(sessionFile)
     exec ":SLoad " . a:sessionName
     let g:startify_disable_at_vimenter = 1
   else
     exec ":SSave " . a:sessionName
   endif
endfunction
" }}} SInit(): Create or load a session "

" Load session as specified by $VIM_SESSION {{{
" And load any corresponding session initialization file in ~/.vim/sessions/
" (If not commandline arguments were given)

let g:sessionInitPath = expand('~/.vim/sessions/')

if !empty($VIM_SESSION) && argc() == 0
  " Load or create session (from sessions.vim)
  autocmd VimEnter * :call SInit($VIM_SESSION)

  let b:sessionInitFile = g:sessionInitPath . $VIM_SESSION . ".vim"
  if filereadable(b:sessionInitFile)
    exec "source " . b:sessionInitFile
  endif

endif
" }}} Load session as specified by $VIM_SESSION
