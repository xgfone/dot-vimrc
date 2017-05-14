"----------------------
"       Plugin
"----------------------
try
	source ~/.vim/plugins.vim
catch
	" Format the status line
	set statusline=CWD:\ %{getcwd()}%m%r%h\ %w\ %y\ \ %p%%[%{GetFilesize()}]\ \ L:%l\ C:%c

	" Delete the trailing whitespace automatically.
	autocmd BufWrite * :call DeleteTrailingWS()
endtry


"----------------------
"       General
"----------------------

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
filetype plugin on
filetype on

" enable syntax hightlight and completion
syntax enable
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=";"
let g:mapleader=";"

" For regular expressions turn magic on
set magic

" Remember info about open buffers on close
set viminfo^=%

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Let the vimrc take effect immediately.
autocmd BufWritePost $MYVIMRC source $MYVIMRC


"----------------------
"        Vim UI
"----------------------

" Display the TAB
"set list listchars=tab:>-,

" color scheme
set background=dark
color desert

" search
set incsearch
set ignorecase
set smartcase
set hlsearch						" Highlight search results

" editor settings
set foldcolumn=1					" Add a bit extra margin to the left
set wildmenu						" Turn on the WiLd menu
set ruler							" Always show current position
set hid								" A buffer becomes hidden when it is abandoned
set history=1000
set nocompatible
set nofoldenable					" disable folding"
set confirm							" prompt when existing from an unsaved file
set backspace=indent,eol,start		" More powerful backspacing
set whichwrap+=<,>,h,l
set t_Co=256						" Explicitly tell vim that the terminal has 256 colors "
set mouse=a							" use mouse in all modes
set report=0						" always report number of lines changed"
set wrap							" dont wrap lines
set scrolloff=5						" 5 lines above/below cursor when scrolling
set number							" show line numbers
set showmatch						" show matching bracket (briefly jump)
set showcmd							" show typed command in status bar
set title							" show file in titlebar
set laststatus=2					" use 2 lines for the status bar
set matchtime=2						" show matching bracket for 0.2 seconds
set matchpairs+=<:>					" specially for html
set noswapfile						" disable swapfile
set nobackup						" disable the backup file after overwriting
set nowb							" disable the backup file before overwriting
set tabpagemax=30					" Tab Page
set textwidth=120
"set relativenumber
"set linebreak

" Default Indentation
filetype indent on
set autoindent
set smartindent
set tabstop=4		" tab width
set softtabstop=4	" backspace
set shiftwidth=4	" indent width
set smarttab		" be smart when using tabs
"set expandtab		" expand tab to space

" Fold code
set foldmethod=indent		" The fold type, indent or syntax
set nofoldenable			" Close the fold when vim starts

" The special setting for the specific type file.
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html,xhtml,htm setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType h,c,hpp,cc,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd FileType go call SetGoPath()

"-----------
" Highlight
"-----------
"set highlight						" conflict with highlight current line

" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn
"hi CursorLine cterm=None ctermbg=darkred ctermfg=white
"hi CursorColumn cterm=None ctermbg=darkred ctermfg=white

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
command! ToggleHighlightStartTAB call ToggleHighlightStartTAB()
"autocmd VimEnter * call ToggleHighlightStartTAB()

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight the assigned column
let b:enableHighlightColumn=0
function! ToggleHighlightColumn()
	if !b:enableHighlightColumn
		set cc=80,100,120
		"hi ColorColumn guibg=#5050
		let b:enableHighlightColumn=1
	else
		set cc=""
		let b:enableHighlightColumn=0
	endif
endfunction
command! ToggleHighlightColumn call ToggleHighlightColumn()
autocmd VimEnter * call ToggleHighlightColumn()


"----------------------
"    Other settings
"----------------------
" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if ! exists("g:leave_my_cursor_position_alone") |
	\		if line("'\"") > 0 && line ("'\"") <= line("$") |
	\			exe "normal g'\"" |
	\		endif |
	\ endif


"----------------------
"	  Key Bindings
"----------------------
" Enable the command :Man to view the man information.
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

" Highlight the assigned column and TAB.
nmap <Leader>hc :ToggleHighlightColumn<CR>
nmap <Leader>ht :ToggleHighlightStartTAB<CR>

" Toggle to delete the trailing whitespaces.
nmap <Leader>td :ToggleDeleteTrailingWS<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Copy the selected text to clipboard
vnoremap <Leader>y "+y

" Paste the text in the clipboard to vim
nmap <Leader>p "+p

" Remap VIM 0 to first non-blank character
map 0 ^

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap nw <c-w><c-w>

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Map <Ctrl>+F12 to ctags.
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Quickly open the vim docs
nmap <silent> <leader>doc :e ~/.vim/docs/vim-doc.txt<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
map <leader>]  >>
map <leader>[  <<

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif


"----------------------
"   Others Functions
"----------------------
func! CurrentFileDir(cmd)
	return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! GetFilesize()
	let bytes = getfsize(expand("%:p"))

	if bytes <= 0
		return ''
	endif

	if bytes < 1024
		return bytes . 'B'
	else
		return (bytes / 1024) . 'kB'
	endif
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
let b:enableDeleteTrailingWS=1
func! DeleteTrailingWS()
	if b:enableDeleteTrailingWS
		exe "normal mz"
		%s/\s\+$//ge
		exe "normal `z"
	endif
endfunc
func! ToggleDeleteTrailingWS()
	if b:enableDeleteTrailingWS
		let b:enableDeleteTrailingWS=0
	else
		let b:enableDeleteTrailingWS=1
	endif
endfunc


"----------------------
"    GUI Settings
"----------------------
if has("gui_running")
	set go=aAce					" remove toolbar
	set go+=mgriR				" display menubar, scrollbar
	"set transparency=30

	set guifont=DejaVuSansMono:h12,Monospace:h12,Courier\ New:h14
	set guitablabel=%M\ %t
	set showtabline=2
	set columns=100
	set lines=35
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

