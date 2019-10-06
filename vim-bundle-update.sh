#!/bin/sh
# Install and maintain vim-plug bundles.
#  https://github.com/junegunn/vim-plug
#  Kudos: https://github.com/junegunn/vim-plug/issues/730
#  Uses autoload/plug.vim

# "-T dumb" lets me see all the output
# "-E" Improved Ex mode, stops complaint about output not being
#     to a TTY.
# Call "set nomore" turns off waiting for user during output
vim='vim -T dumb -E'

# XXX I'm not sure what this actually does. May need tweaking
#     to commit upgrade to git.
echo "Updating vim-plug"
${vim} -c "set nomore|PlugUpgrade|qall" &> /dev/null

echo "Updating vim-plug bundles"
# Need 'qall' here instead of just 'quit'
${vim} -c "set nomore|PlugUpdate!|qall" &> /dev/null

# Not calling 'PlugClean' - do that manually.

exit 0
