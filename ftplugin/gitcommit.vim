" GIT commits

" Disable modelines in GIT commits to parsing commit messages with
" 'git --amend'
" Kudos: http://www.dreamind.de/cgi-bin/gitweb.cgi?p=configurations.git;a=commitdiff_plain;h=8bfd2c81b8bbcf79dec9771daf7ac2cb57fe12ce
setlocal nomodeline

" Disable saving/loading views for GIT commits
augroup autoview
  autocmd!
augroup End

" Disable backups
setlocal nobackup

" Disable saving of undo information
setlocal noundofile
