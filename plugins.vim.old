"==========================================================
"                      Plugins
"==========================================================
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()

" The plugin vundle MUST be between vundle#begin() and vundle#end().
call vundle#begin()

" let Vundle manage Vundle (required!)
Plugin 'VundleVim/Vundle.vim'

"------------------
" Code Completions
"------------------
Plugin 'Shougo/neocomplete.vim'	" Next generation completion framework. Require +Lua.
Plugin 'jiangmiao/auto-pairs'	" Insert or delete brackets, parens, quotes in pair.
Plugin 'ervandew/supertab'		" Perform the insert mode completions with Tab.

"-----------------
" Fast navigation
"-----------------
Plugin 'easymotion/vim-easymotion'

"--------------
" Fast editing
"--------------
Plugin 'scrooloose/nerdcommenter'			" Comment functions.
Plugin 'sjl/gundo.vim'						" Visualize your Vim undo tree.
Plugin 'Yggdroot/indentLine'                " Display the indention levels.
"Plugin 'nathanaelkane/vim-indent-guides'	" Visually displaying indent levels.
Plugin 'godlygeek/tabular'					" Text filtering and alignment.

"--------------
" IDE features
"--------------
Plugin 'scrooloose/nerdtree'				" A tree explorer plugin.
"Plugin 'majutsushi/tagbar'					" A class outline viewer.
Plugin 'vim-airline/vim-airline'			" A status/tab line plugin.
Plugin 'vim-syntastic/syntastic'			" Syntax checking hacks for vim.
Plugin 'bronson/vim-trailing-whitespace'	" Highlights trailing whitespace.
Plugin 'mileszs/ack.vim'					" Run the search tool [ack].
Plugin 'humiaozuzu/TabBar'					" Add tab bar.
Plugin 'luzhlon/popup.vim'					" Popup the menu from the bottom.

"-------------
" Other Utils
"-------------
" Plugin 'humiaozuzu/fcitx-status'
Plugin 'nvie/vim-togglemouse'		" Toggle the mouse focus between Vim and terminal emulator.
Plugin 'mbbill/fencview'			" Auto detect CJK and Unicode file encodings.
Plugin 'skywind3000/asyncrun.vim'	" Run Async Shell Commands and Output to Quickfix Window.
Plugin 'ctrlpvim/ctrlp.vim'			" Full path fuzzy file, buffer, mru, tag, ... finder.
"Plugin 'uguu-org/vim-matrix-screensaver'	" Matrix Screen.

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- Go ----------
Plugin 'fatih/vim-go'					" Go development plugin for Vim.

"------- Python -------
Plugin 'python-mode/python-mode'		" Python support. Conflict with jedi-vim.
"Plugin 'davidhalter/jedi-vim'			" Python autocompletion by using Jedi.

"------- markup language -------
Plugin 'tpope/vim-markdown'				" Syntax highlighting and filetype plugins for Markdown.
Plugin 'iamcco/markdown-preview.vim'	" Real-time markdown preview.

"------- web frontend ----------
Plugin 'othree/html5.vim'					" HTML5 omnicomplete and syntax.
Plugin 'pangloss/vim-javascript'			" Vastly improved Javascript indentation and syntax.
"Plugin 'kchmck/vim-coffee-script'			" CoffeeScript support.
"Plugin 'groenewege/vim-less'				" Syntax highlight, indent and autocompletion for LESS.
"Plugin 'mustache/vim-mustache-handlebars'	" mustache and handlebars mode

"------- web backend ---------
"Plugin 'lepture/vim-jinja'		" Jinja template engine syntax highlight and indent supoort.
"Plugin 'digitaltoad/vim-pug'	" Pug (former Jade) template engine syntax highlight and indention.

"------- Rust --------
"Plugin 'rust-lang/rust.vim'	" Rust syntax highlighting, formatting, Syntastic integration, etc.

"--------------
" Color Schemes
"--------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'rickharris/vim-monokai'
Plugin 'chriskempson/base16-vim'

" The plugin vundle ends.
call vundle#end()

filetype plugin indent on     " required!


"==========================================================
"                  Plugin settings
"==========================================================

"-----------------
"   NeoComplete
"-----------------
" Disable AutoComplPop
let g:acp_enableAtStartup=0

" Use neocomplete.
let g:neocomplete#enable_at_startup=1

" Use smartcase.
let g:neocomplete#enable_smart_case=1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting. https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"---------------
"   SuperTab
"---------------
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabDefaultCompletionType='<C-X><C-U>'
let g:SuperTabRetainCompletionType=2


"----------------
"   easymotion
"----------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"-------------------
"   nerdcommenter
"-------------------
" Add spaces after comment delimiters by default
let NERDSpaceDelims=1

" Use compact syntax for prettified multi-line comments
let NERDCompactSexyComs=1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }


"-----------------
"   indentLine
"-----------------
let g:indentLine_char = '┆'

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'


"------------------
"   IndentGuides
"------------------
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey


"---------------
"   Nerd Tree
"---------------
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinPos = "left"


"------------
"   Tagbar
"------------
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


"-----------------
"   vim-airline
"-----------------
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


"---------------
"   syntasic
"---------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-------------------------
"   trailing-whitespace
"-------------------------
let g:extra_whitespace_ignored_filetypes = ['mkd']
autocmd BufWrite * :FixWhitespace


"-------------
"   ack.vim
"-------------
nnoremap <leader>a :Ack


"------------
"   tabbar
"------------
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1


"--------------
"   fencview
"--------------
let g:fencview_autodetect = 1


"------------
"   vim-go
"------------
" Disable the autoinstall
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

function! SetGoPath()
    if $GOPATH == ''
        let $GOPATH=$HOME . "/go"
    endif
endfunction


"------------------
"   vim-markdown
"------------------
autocmd BufNewFile,BufReadPost *.{md,markdown,mkd} set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']


"--------------------------
"   markdown-preview.vim
"--------------------------
" path to the chrome or the command to open chrome(or other modern browsers)
"let g:mkdp_path_to_chrome = "google-chrome"

" set to 1, the vim will just refresh markdown when save the buffer or leave
" from insert mode, default 0 is auto refresh markdown as you edit or move
" the cursor.
"let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
let g:mkdp_command_for_global = 0


"--------------------
"   vim-javascript
"--------------------
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1


"============================================================
"                Keybindings for plugin
"============================================================
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <F5> :NERDTreeToggle<cr>
nmap <F6> :TagbarToggle<cr>

" Bind shortcut key for Markdown-Preview
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
