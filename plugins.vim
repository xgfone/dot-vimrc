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
"Plug 'easymotion/vim-easymotion'      " Motion on speed

"----------------------
"    Color Schemes
"----------------------
Plug 'rickharris/vim-monokai'
Plug 'chriskempson/base16-vim'

"----------------------
"        VIM UI
"----------------------
Plug 'powerline/powerline', {'tag': '2.7'}  " Statusline
Plug 'vim-airline/vim-airline'              " A status/tab line plugin
Plug 'Yggdroot/indentLine'                  " Indent line
Plug 'scrooloose/nerdtree'                  " A tree explorer plugin.
Plug 'sjl/gundo.vim'                        " Visualize your Vim undo tree
Plug 'majutsushi/tagbar'                    " A class outline viewer
"Plug 'luzhlon/popup.vim'                   " Popup the menu from the bottom

"=============================================================================

"----------------------
"     Programming
"----------------------
Plug 'vim-syntastic/syntastic'              " Syntax checking hacks for vim
Plug 'scrooloose/nerdcommenter'             " Comment functions

"----------------------
"   Code Completion
"----------------------
Plug 'jiangmiao/auto-pairs'   " Insert or delete brackets, parens, quotes in pair
Plug 'ervandew/supertab'      " Perform the insert mode completions with Tab

if v:version >= 800
    Plug 'w0rp/ale'           " Asynchronous Lint Engine with LSP integration

    if has('python3')
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
        let g:deoplete#enable_at_startup = 1
    endif
endif

"----------------------
"        Golang
"----------------------
Plug 'fatih/vim-go'           " Go development plugin for Vim

"----------------------
"        Python
"----------------------
Plug 'python-mode/python-mode'      " Python support. Conflict with jedi-vim
"Plug 'davidhalter/jedi-vim'        " Python autocompletion by using Jedi

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


"=========================================================
"                     Plugin Settings
"=========================================================

"-------------------------------------
"              fencview
"-------------------------------------
let g:fencview_autodetect = 1


"-------------------------------------
"   bronson/vim-trailing-whitespace
"-------------------------------------
let g:extra_whitespace_ignored_filetypes = ['rst']
autocmd BufWrite * FixWhitespace


"-------------------------------------
"           mileszs/ack.vim
"-------------------------------------
" Don't jump to the first result automatically.
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>


"-------------------------------------
"     easymotion/vim-easymotion
"-------------------------------------
" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1


"-------------------------------------
"      vim-airline/vim-airline
"-------------------------------------
" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tmuxline#enabled = 1

let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


"-------------------------------------
"         Yggdroot/indentLine
"-------------------------------------
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239       " For Vim
let g:indentLine_color_gui = '#A4E57E'  " For Vim


"-------------------------------------
"        scrooloose/nerdtree
"-------------------------------------
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.swp$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinPos = "left"


"-------------------------------------
"          majutsushi/tagbar
"-------------------------------------
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers=1

" For Language, See https://github.com/majutsushi/tagbar/wiki.

" tag for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" tag for C/C++
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


"-------------------------------------
"      vim-syntastic/syntastic
"-------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint', 'pep8']


"-------------------------------------
"      scrooloose/nerdcommenter
"-------------------------------------
" Add spaces after comment delimiters by default
let NERDSpaceDelims=1

" Use compact syntax for prettified multi-line comments
let NERDCompactSexyComs=1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }


"-------------------------------------
"        ervandew/supertab
"-------------------------------------
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType='context'


"-------------------------------------
"              w0rp/ale
"-------------------------------------
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'


"-------------------------------------
"            fatih/vim-go
"-------------------------------------
"let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goreturns"

function! SetGoPath()
    if $GOPATH == ''
        let $GOPATH=$HOME . "/gopath"
    endif
endfunction
autocmd FileType go call SetGoPath()


"-------------------------------------
"         tpope/vim-markdown
"-------------------------------------
autocmd BufNewFile,BufReadPost *.{md,markdown,mkd} set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']


"-------------------------------------
"    iamcco/markdown-preview.vim
"-------------------------------------
" path to the chrome or the command to open chrome(or other modern browsers)
"let g:mkdp_path_to_chrome = "google-chrome"

" set to 1, the vim will just refresh markdown when save the buffer or leave
" from insert mode, default 0 is auto refresh markdown as you edit or move
" the cursor.
let g:mkdp_refresh_slow = 1


"-------------------------------------
"      python-mode/python-mode
"-------------------------------------
"let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120
let g:pymode_lint_checkers = ['pep8', 'pylint', 'pyflakes']


"-------------------------------------
"        davidhalter/jedi-vim
"-------------------------------------
let g:jedi#use_splits_not_buffers = "bottom"


"=========================================================
"                Keybindings For Plugin
"=========================================================

"nmap <F4> :IndentLinesToggle<cr>
"nmap <F5> :NERDTreeToggle<cr>
"nmap <F6> :TagbarToggle<cr>

" Bind shortcut key for Markdown-Preview
"nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
"imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
"nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
"imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

