" Configuration for GitGutter plugin

" Use colored dots instead of "+/-/etc."
" Kudos: https://github.com/statico/dotfiles/blob/master/.vim/vimrc
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Background matches LineNr in ./colors.vim
"   Setting g:gitgutter_override_sign_column_highlight = 0 doesn't seem
"   to work.
highlight GitGutterAdd ctermfg=green ctermbg=236
highlight GitGutterChange ctermfg=yellow ctermbg=236
highlight GitGutterDelete ctermfg=red ctermbg=236
" A changed line followed by at least one removed line
highligh GitGutterChangeDelete ctermfg=136 ctermbg=236