source ~/.vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileformats=unix,dos,mac
set encoding=utf-8
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

" solve the menu messy code.
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set langmenu=zh_CN.utf-8

" solve the command line messy code.
"language messages zh_CN.utf-8

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" For regular expressions turn magic on
set magic

" Remember info about open buffers on close
set viminfo^=%

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"--------
" Vim UI
"--------
" Display the TAB
"set list listchars=tab:>-,

" Highlight the TAB
autocmd BufWinEnter * syntax match StartTAB /\t\+/
autocmd InsertLeave * syntax match StartTAB /\t\+/
autocmd InsertEnter * syntax match StartTAB /\t\+/
let b:StartTABToggle=0
function! ToggleHighlightStartTAB()
    if !b:StartTABToggle
        let b:StartTABToggle=1
        highlight StartTAB ctermbg=red guibg=red
    else
        let b:StartTABToggle=0
        highlight StartTAB ctermbg=NONE guibg=NONE
    endif
endfunction
command! -bar ToggleHighlightStartTAB call ToggleHighlightStartTAB()
nmap <F7> :ToggleHighlightStartTAB<cr>

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Set the linespace
"set linespace=6

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" color scheme
set background=dark
color desert

" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

" Add a bit extra margin to the left
set foldcolumn=1

" Highlight the assigned columns
if &ft != "" && &ft != "text"
    set noexpandtab
    set cc=80,120
    "hi ColorColumn guibg=#5050
endif

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase
set hlsearch       " Highlight search results

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set whichwrap+=<,>,h,l
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed"
set wrap                                                          " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
"set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
"set textwidth=79
"set linebreak
set smarttab
set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType h,c,hxx,hpp,cc,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=120 noexpandtab

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" vim-go
" Disable the autoinstall
let g:go_disable_autoinstall = 1

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
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

" powerline
"let g:Powerline_symbols = 'fancy'

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
nmap wm :WMToggle<cr>


" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

" vim-htmldjango_omnicomplete
autocmd FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
let g:htmldjangocomplete_html_flavour = 'html5'
autocmd FileType htmldjango inoremap {% {% %}<left><left><left>
autocmd FileType htmldjango inoremap {{ {{ }}<left><left><left>

" trailing-whitespace
autocmd BufWrite * :FixWhitespace


"------------------
" Useful Functions
"------------------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
map <leader>]  >>
map <leader>[  <<

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    set go+=mgriR " display menubar, scrollbar
    "set transparency=30

    if has("gui_mac")  " For Mac Vim
        set guifont=DejaVuSansMono:h12,Monospace:h12
    else               " For Gnome, Gtk+, Gtk+ 2, Win32, ...
        set guifont=DejaVuSansMono\ 12,Monospace\ 12
    endif

    set guitablabel=%M\ %t
    set showtabline=2
    set columns=80
    set lines=30
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif
