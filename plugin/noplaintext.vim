" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Modified from:
" Author: Tom Ryder <tom@sanctum.geek.nz>
" From: https://gist.github.com/tejr/5890634
"

" The '/private' part is Mac-specific
let s:passtmp='/private' . expand('$TMPDIR') . "pass.*/*"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    let &backupskip = &backupskip . ',' . s:passtmp
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ s:passtmp
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ s:passtmp
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ s:passtmp
                \ setlocal viminfo=
        augroup END
    endif
endif

