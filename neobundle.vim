" Configure NeoBundle and set up bundles
"
" NeoBundle setup {{{
"
" First time run ':NeoBundleInstall' to install bundles
" Then run ':NeoBundleUpdate' to update.

" Use ~/.vim-bundle to keep bundles out of git repo
" This is needed in part because YCM used submodules
let g:pluginInstallDir = expand('~/.vim-bundle')

if !isdirectory(g:pluginInstallDir)
  execute 'silent! mkdir -p ' . g:pluginInstallDir
endif

let s:neobundleDir = g:pluginInstallDir . '/neobundle.vim'

" Clone neobundle if not present
" Kudos: https://bitbucket.org/slimane/vimlabo/wiki/.vimrc.neobundle

if !isdirectory(s:neobundleDir) && executable('git')
  execute 'silent ! git clone https://github.com/Shougo/neobundle.vim ' . s:neobundleDir
endif

if has('vim_starting')
  execute 'set runtimepath+=' . s:neobundleDir
endif

call neobundle#begin(g:pluginInstallDir)

" Hack: For some reason the aboe call seems to reset filetype indent
filetype indent on

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Allow async command running for autocompletion
" Kudos: https://github.com/joedicastro/dotfiles/blob/master/vim/vimrc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" }}} NeoBundle
"----------------------------------------------------------------------
" Load Bundles {{{
"
" Note that bundles apparently need to be in vimrc (as opposed to
" in a plugin).

" Show git changes on left
NeoBundle 'airblade/vim-gitgutter'

" Fancy statusline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Handle indention with pasting nicely
NeoBundle 'von-forks/vim-bracketed-paste'

" Rename current buffer with ':rename <name>'
NeoBundle 'danro/rename.vim'

" C-p: Open files with fuzzy matching
NeoBundle 'ctrlpvim/ctrlp.vim'

" Allow one-keystroke navigation between vi panes and tmux panes
" Use Shift-<arrow keys> to switch between panes/vim windows
NeoBundle 'christoomey/vim-tmux-navigator'

" Allow me to rename tabs
NeoBundle 'gcmt/taboo.vim'

" Allow for easy rendering of markdown
NeoBundle 'JamshedVesuna/vim-markdown-preview'

" Allows definiton of arbitrary objects (prereusite of following)
NeoBundle 'kana/vim-textobj-user'
" vim-textobj-entire adds text object of 'ae' for entire buffer
" ('ie' excludes leading and trailing whitespace)
NeoBundle 'kana/vim-textobj-entire'
" Adds 'al' for entire line and 'il' without leading and trailing whitespace
NeoBundle 'kana/vim-textobj-line'

" Basically a Python IDE
" Note this resets the filetypedetect augroup so some other bundles need
" to be after this plugin, namely securemodelines
NeoBundle 'klen/python-mode'

" Enable faster folding
" Required for neocomplete and foldtype=syntax or expr
NeoBundle 'Konfekt/FastFold'

" Following requires ctags-exuberant from ctags.sourceforge.net
"   (On mac: brew install ctags-exuberant)
NeoBundle 'majutsushi/tagbar'

" Requires lau
" E.g. brew install macvim --with-cscope --with-lua --HEAD
NeoBundle 'Shougo/neocomplete'

" For BDelete
NeoBundle 'moll/vim-bbye'

" Markdown file folding and commands
NeoBundle 'plasticboy/vim-markdown'

" Quickfix commands
NeoBundle 'romainl/vim-qf'

" For grep via <leader>g
NeoBundle 'Shougo/unite.vim'

" Let me associate buffers with tabs
NeoBundle 'Shougo/tabpagebuffer.vim'

" Allow snippet expansion with <tab>
NeoBundle 'SirVer/ultisnips'
" Snippets for ultisnips
NeoBundle 'honza/vim-snippets'

" Let me view all my undo information with <leader>u
NeoBundle 'sjl/gundo.vim'

" Let me pop up a menu of commands
NeoBundle 'skywind3000/quickmenu.vim'

" Allow changing surround quotes with 'cs<current><new>'
NeoBundle 'tpope/vim-surround'

" Allow use of 'v' to expand region, 'V' to shrink
NeoBundle 'terryma/vim-expand-region'

" Allow for use of {x,y} in abbrevIation and substitutions
" Plus: crc for camelCase, crm for MixedCase, and crs for snake_case
NeoBundle 'tpope/vim-abolish'

" 'gcc' to comment/uncomment line, or gc<motion target>
NeoBundle 'tpope/vim-commentary'

" :GBlame and friends
NeoBundle 'tpope/vim-fugitive'

" readline-like key bindings in insert mode
NeoBundle 'tpope/vim-rsi'

" Start screen for vim
NeoBundle 'mhinz/vim-startify'

" Allow toggling full screen windows
NeoBundle 'regedarek/ZoomWin'

" Key bindings with '[' and ']' prefixes
NeoBundle 'tpope/vim-unimpaired'

" Integration with vifm
NeoBundle 'vifm/vifm.vim'

" Highlighting for applescript
NeoBundle 'vim-scripts/applescript.vim'

" Highlighting for BATS
" https://github.com/sstephenson/bats
NeoBundle 'vim-scripts/bats.vim'

" For :Scratch and Sscratch
NeoBundle 'vim-scripts/scratch.vim'

" Only allow certain things in modelines
" Note this needs to be loaded after python-mode since that seems
" to reset the filetypedetect autogroup which causes ftplugin to
" run after modeline processing.
NeoBundle 'ciaranm/securemodelines'

call neobundle#end()

" }}} Misc Bundles
"------------------------------------------------------------
" NeoBundleCheck {{{

" Installation check.
NeoBundleCheck

" }}} NeoBundleCheck
