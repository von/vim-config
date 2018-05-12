" after/options.vim
" Options to changed after modules loaded.

" Additional options for securemodelines
if (exists("g:secure_modelines_allowed_items"))
  :call add(g:secure_modelines_allowed_items, "nowrap")
endif
