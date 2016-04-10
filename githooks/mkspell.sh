#!/bin/sh
# Make vim spl (spell check) files if sources have updated
# Kudos: http://stackoverflow.com/a/27257178/197789
#
# To install:
# Link this script to .git/hooks/post-checkout
# Or for submodule, link to .git/modules/vim/hooks in supermodule

for src in spell/en.utf-8.add ; do
  if test ! -e ${src} ; then
    echo "$0: Warning: \"${src}\" does not exist."
    continue
  fi
  dst=${src}.spl
  if test ! -e ${dst} -o ${src} -nt ${dst} ; then
    echo "$0: Updating \"${dst}\""
    # Invoke vim as vimscript intrpreter
    # Kudos: http://vim.wikia.com/wiki/Vim_as_a_system_interpreter_for_vimscript
    vim -i NONE -u NONE -U NONE -V1 -nNesc \
      "execute \":mkspell! \" . fnameescape(\"${src}\")  . \" | qall!\""
  fi
done
exit 0
