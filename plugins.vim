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
Bundle 'VundleVim/Vundle.vim'

"------------------
" Code Completions
"------------------
Bundle 'Shougo/neocomplcache'			" Ultimate auto-completion system for Vim.
Bundle 'Raimondi/delimitMate'			" provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle 'ervandew/supertab'				" Perform all your vim insert mode completions with Tab

"-----------------
" Fast navigation
"-----------------
Bundle 'easymotion/vim-easymotion'			" Vim motions on speed!

"--------------
" Fast editing
"--------------
Bundle 'scrooloose/nerdcommenter'			" Comment functions.
Bundle 'sjl/gundo.vim'						" visualize your Vim undo tree.
Bundle 'nathanaelkane/vim-indent-guides'	" visually display indent levels.
Bundle 'godlygeek/tabular'					" text filtering and alignment.

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/winmanager'

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
Bundle 'nvie/vim-togglemouse'
Bundle 'mbbill/fencview'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- Go ----------
Bundle 'fatih/vim-go'

"------- markup language -------
Bundle 'tpope/vim-markdown'
Bundle 'iamcco/markdown-preview.vim'

"------- web frontend ----------
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
"Bundle 'nono/jquery.vim'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'groenewege/vim-less'
"Bundle 'mustache/vim-mustache-handlebars'

"------- web backend ---------
"Bundle 'lepture/vim-jinja'
"Bundle 'digitaltoad/vim-jade'

"------- Rust --------
"Bundle 'rust-lang/rust.vim'

"--------------
" Color Schemes
"--------------
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'fisadev/fisa-vim-colorscheme'

" The plugin vundle ends.
call vundle#end()

filetype plugin indent on     " required!


"==========================================================
"                  Plugin settings
"==========================================================

" vim-markdown
autocmd BufNewFile,BufReadPost *.{md,markdown,mkd,txt} set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go', 'c', 'css', 'javascript']

" markdown-preview.vim
" path to the chrome or the command to open chrome(or other modern browsers)
"let g:mkdp_path_to_chrome = "google-chrome"

" set to 1, the vim will just refresh markdown when save the buffer or leave from
" insert mode, default 0 is auto refresh markdown as you edit or move the cursor.
"let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
let g:mkdp_command_for_global = 0

" Bind shortcut key for Markdown-Preview
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode


" vim-go
" Disable the autoinstall
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

function! SetGoPath()
    if $GOPATH == ''
        let $GOPATH=$HOME . "/go"
    endif
endfunction


" fencview
let g:fencview_autodetect = 1


" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white


" easy-motion
let g:EasyMotion_leader_key = '<Leader>'


" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

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

" tag for coffee
"if executable('coffeetags')
"  let g:tagbar_type_coffee = {
"        \ 'ctagsbin' : 'coffeetags',
"        \ 'ctagsargs' : '',
"        \ 'kinds' : [
"        \ 'f:functions',
"        \ 'o:object',
"        \ ],
"        \ 'sro' : ".",
"        \ 'kind2scope' : {
"        \ 'f' : 'object',
"        \ 'o' : 'object',
"        \ }
"        \ }
"
"  let g:tagbar_type_markdown = {
"    \ 'ctagstype' : 'markdown',
"    \ 'sort' : 0,
"    \ 'kinds' : [
"        \ 'h:sections'
"    \ ]
"    \ }
"endif


" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinPos = "right"


" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1


" powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='solarized256'


" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
let g:neocomplcache_enable_underbar_completion = 1    " enable
let g:neocomplcache_enable_camel_case_completion = 1  " enable
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'


" SuperTab
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabDefaultCompletionType='<C-X><C-U>'
let g:SuperTabRetainCompletionType=2


" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store,*#,*~  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'


" IndentGuides
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"if g:isTerminal
"    hi IndentGuidesOdd  ctermbg=236
"    hi IndentGuidesEven ctermbg=237
"else
"endif


" WinManager plugin
let g:winManagerWindowLayout='FileExplorer|TagList'


" trailing-whitespace
autocmd BufWrite * :FixWhitespace


" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <D-/> :
nmap wm :WMToggle<cr>
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

