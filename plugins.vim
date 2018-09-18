"=========================================================
"                    Plugin Manager
"=========================================================
" Install the plug plugin manager automatically if missing.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"----------------------
"        General
"----------------------
Plug 'mbbill/fencview'                 " Auto detect CJK and Unicode file encodings
Plug 'skywind3000/asyncrun.vim'        " Run Async Shell Commands and Output to Quickfix Window
Plug 'nvie/vim-togglemouse'            " Toggle the mouse focus between Vim and terminal emulator
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace

"----------------------
"  Naigation & Search
"----------------------
Plug 'ctrlpvim/ctrlp.vim'              " Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'mileszs/ack.vim'                 " Run the search tool [ack]
Plug 'easymotion/vim-easymotion'       " Motion on speed

"----------------------
"    Color Schemes
"----------------------
Plug 'rickharris/vim-monokai'
Plug 'chriskempson/base16-vim'

"----------------------
"        VIM UI
"----------------------
Plug 'powerline/powerline', {'tag': '2.7'}  " Statusline
Plug 'Yggdroot/indentLine'                  " Indent line
Plug 'vim-airline/vim-airline'              " A status/tab line plugin
Plug 'scrooloose/nerdtree'                  " A tree explorer plugin.
Plug 'luzhlon/popup.vim'                    " Popup the menu from the bottom
Plug 'sjl/gundo.vim'                        " Visualize your Vim undo tree
Plug 'majutsushi/tagbar'                    " A class outline viewer

"=============================================================================

"----------------------
"     Programming
"----------------------
Plug 'vim-syntastic/syntastic'              " Syntax checking hacks for vim
Plug 'scrooloose/nerdcommenter'             " Comment functions

"----------------------
"   Code Completion
"----------------------
Plug 'Shougo/neocomplete.vim' " Next generation completion framework. Require +Lua
Plug 'jiangmiao/auto-pairs'   " Insert or delete brackets, parens, quotes in pair
Plug 'ervandew/supertab'      " Perform the insert mode completions with Tab

"----------------------
"        Golang
"----------------------
Plug 'fatih/vim-go'           " Go development plugin for Vim

"----------------------
"        Python
"----------------------
Plug 'python-mode/python-mode'      " Python support. Conflict with jedi-vim
Plug 'davidhalter/jedi-vim'         " Python autocompletion by using Jedi

"---------------------
"      Makedown
"---------------------
"Plug 'tpope/vim-markdown'           " Syntax highlighting and filetype plugins for Markdown
Plug 'iamcco/markdown-preview.vim'  " Real-time markdown preview

"---------------------
"        C++
"---------------------
Plug 'octol/vim-cpp-enhanced-highlight'  " Syntax highlighting for C++11/14/17

call plug#end()

