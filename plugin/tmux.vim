"tmux related configuration
if !empty($TMUX)

" The following are the starting and stopping escape sequences tmux expects
" for setting the pane title.
set t_ts=]2;
set t_fs=\\

endif " TMUX
