" Configuration for vimwiki mode

" Restore bindings for NeoComplete and Ultisnips {{{
if exists('*NeoCompleteToggle')
  " BTW, it is tempting to use escape to cancel Neocomplete menu, but it is part of the
  " sequence for arrow keystrokes, so will not have the desired results.

  " <Tab> completes NeoComplete popup if Open, otherwise acts normally
  inoremap <expr><buffer> <Tab> pumvisible() ? neocomplete#close_popup() : "<Tab>"

  " <S-Tab> completes Ultisnip
  inoremap <buffer> <S-Tab> <C-R>=UltiSnips#ExpandSnippet()<CR>

  " <CR> always inserts a <CR>, canceling NeoComplete popup if Open
  inoremap <expr><buffer> <CR> pumvisible() ? neocomplete#cancel_popup() . "<CR>" : "<CR>"
endif
" }}}
