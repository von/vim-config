" Configuration for dein bundle manager
" https://github.com/Shougo/dein.vim
"
" Note: this block of code will turn off 'filetype'

" g:vimlocal defined in ./vimrc
let g:deinPath=g:vimlocal . '/dein/'
let g:deinInstallPath=g:deinPath . '/repos/github.com/Shougo/dein.vim'

" Don't print install updates messages as they just clutter things
let g:dein#install_progress_type="none"
let g:dein#install_message_type="none"

" Create the dein install path if it doesn't exist and clone in dein
if !isdirectory(g:deinInstallPath)
  echom "Installing dein"
  execute '!mkdir -p ' . g:deinInstallPath . ' && git clone https://github.com/Shougo/dein.vim ' . g:deinInstallPath
  let g:deinInstalled=1
endif

if has('vim_starting')
  " Bootstrap dein: Add the dein installation directory into runtimepath
  execute 'set runtimepath+=' . g:deinInstallPath
endif

if dein#load_state(g:deinPath)
  " Note: begin() executes ":filetype off" automatically.
  " Note: Per dein document, begin() should not be called inside a
  "       has('vim_starting')" block.
  call dein#begin(g:deinPath)

  call dein#add(g:deinInstallPath)

  " Show git changes on left
  call dein#add('airblade/vim-gitgutter')

  " Fancy statusline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Handle indention with pasting nicely
  call dein#add('von-forks/vim-bracketed-paste')

  " Rename current buffer with ':rename <name>'
  call dein#add('danro/rename.vim')

  " C-p: Open files with fuzzy matching
  call dein#add('ctrlpvim/ctrlp.vim')

  " Allow one-keystroke navigation between vi panes and tmux panes
  " Use Control-<arrow keys> to switch between panes/vim windows
  " My tmux.conf maps S-<arrow keys> to C-<arrow keys> in vim
  call dein#add('christoomey/vim-tmux-navigator')

  " Allow me to rename tabs
  call dein#add('gcmt/taboo.vim')

  " Allow for easy rendering of markdown
  call dein#add('JamshedVesuna/vim-markdown-preview')

  " FZF plugin
  set rtp+=/usr/local/opt/fzf
  call dein#add('junegunn/fzf.vim')

  " Allows definiton of arbitrary objects (prereusite of following)
  call dein#add('kana/vim-textobj-user')
  " vim-textobj-entire adds text object of 'ae' for entire buffer
  " ('ie' excludes leading and trailing whitespace)
  call dein#add('kana/vim-textobj-entire')
  " Adds 'al' for entire line and 'il' without leading and trailing whitespace
  call dein#add('kana/vim-textobj-line')

  " Basically a Python IDE
  " Note this resets the filetypedetect augroup so some other bundles need
  " to be after this plugin, namely securemodelines
  call dein#add('klen/python-mode')

  " Enable faster folding
  " Required for neocomplete and foldtype=syntax or expr
  call dein#add('Konfekt/FastFold')

  " Following requires ctags-exuberant from ctags.sourceforge.net
  "   (On mac: brew install ctags-exuberant)
  call dein#add('majutsushi/tagbar')

  " Requires lau
  " E.g. brew install macvim --with-cscope --with-lua --HEAD
  call dein#add('Shougo/neocomplete')

  " For BDelete
  call dein#add('moll/vim-bbye')

  " Markdown file folding and commands
  call dein#add('plasticboy/vim-markdown')

  " Quickfix commands
  call dein#add('romainl/vim-qf')

  " For grep via <leader>g
  call dein#add('Shougo/unite.vim')

  " Let me associate buffers with tabs
  call dein#add('Shougo/tabpagebuffer.vim')

  " Allow snippet expansion with <tab>
  call dein#add('SirVer/ultisnips')
  " Snippets for ultisnips
  call dein#add('honza/vim-snippets')

  " Let me view all my undo information with <leader>u
  if has('python3')
    " Work with python3.
    " Kudos: https://bitbucket.org/sjl/gundo.vim/issues/42/about-python3-support
    let g:gundo_prefer_python3 = 1
  endif
  call dein#add('sjl/gundo.vim')

  " Let me run async commands in VIM > 8
  call dein#add('skywind3000/asyncrun.vim')

  " Let me pop up a menu of commands
  call dein#add('skywind3000/quickmenu.vim')

  " Allow changing surround quotes with 'cs<current><new>'
  call dein#add('tpope/vim-surround')

  " Allow use of 'v' to expand region, 'V' to shrink
  call dein#add('terryma/vim-expand-region')

  " So Focus autocmds work right. Important for GitGutter
  " Note: this requires 'set -g focus-events on' in tmux.conf
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " Allow for use of {x,y} in abbrevIation and substitutions
  " Plus: crc for camelCase, crm for MixedCase, and crs for snake_case
  call dein#add('tpope/vim-abolish')

  " 'gcc' to comment/uncomment line, or gc<motion target>
  call dein#add('tpope/vim-commentary')

  " :GBlame and friends
  call dein#add('tpope/vim-fugitive')

  " readline-like key bindings in insert mode
  call dein#add('tpope/vim-rsi')

  " Start screen for vim
  call dein#add('mhinz/vim-startify')

  " Allow toggling full screen windows
  call dein#add('regedarek/ZoomWin')

  " Better indentation for lua
  call dein#add('tbastos/vim-lua')

  " Key bindings with '[' and ']' prefixes
  call dein#add('tpope/vim-unimpaired')

  " Integration with vifm
  call dein#add('vifm/vifm.vim')

  " Highlighting for applescript
  call dein#add('vim-scripts/applescript.vim')

  " Highlighting for BATS
  " https://github.com/sstephenson/bats
  call dein#add('vim-scripts/bats.vim')

  " For :Scratch and Sscratch
  call dein#add('vim-scripts/scratch.vim')

  " Only allow certain things in modelines
  " Note this needs to be loaded after python-mode since that seems
  " to reset the filetypedetect autogroup which causes ftplugin to
  " run after modeline processing.
  call dein#add('von-forks/securemodelines')

  call dein#end()
  call dein#save_state()

  if exists('g:deinInstalled')
    " Continue install started above
    echom "Installing dein packages"
    call dein#install()
  else
    " Check if we need to update or install missing packages
    if dein#check_install()
      echom "Updating dein packages"
      call dein#update()
    endif
  endif

endif  " if dein#load_state(g:deinPath)
