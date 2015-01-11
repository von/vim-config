"Configuration related to manipulating and navigation between windows/panes

" Kudos: http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally

" Kudos: http://codeincomplete.com/posts/2011/3/4/my_vimrc_file/
" Split vertically with '|' and open file explorer
map <Bar>   :vsplit .<cr>
" Split horizontally with '-'
" Don't open file explorer since I'm more likely to be doing a horizontal
" split to get two views on the current file.
map -       <C-W>s<C-W><Down>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
set splitbelow
set splitright
