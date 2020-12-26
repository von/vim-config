" neovim configuration file (~/.config/nvim/init.el)
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Neovim-specific configuration

" Show results of commands incrementally in a split window
" kudos: https://blog.kdheepak.com/three-built-in-neovim-features.html
set inccommand=split
