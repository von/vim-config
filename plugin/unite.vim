" Unite plugin configuration
" Kudos: http://www.reinteractive.net/posts/166-awesome-vim-plugins

" grep interface
nnoremap <silent> <leader>g :Unite grep:.<cr>

" Recently edited files
nnoremap <silent> <leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>k

" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
" replacing unite with ctrl-p
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>
