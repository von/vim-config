" Indent works OK, can't get syntax to work, so my preference...
set foldmethod=marker

" <leader>ms causes Hammerspoon to source current file
nmap <leader>ms :call HammerspoonSourceCurrentFile()<cr>

" <leader>mR reloads my Hammerspoon configuration
nmap <leader>mR :call HammerspoonReload()<cr>
