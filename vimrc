"------------------------------------------------"
"                                                "
" Author: xgfone                                 "
" HomePage: https://github.com/xgfone/dot-vimrc  "
"                                                "
"------------------------------------------------"

"=========================================================
"                 Try To Load Plugins
"=========================================================
try
	source ~/.vim/plugins.vim
catch
	" Format the status line
	set statusline=CWD:\ %{getcwd()}%m%r%h\ %w\ %y\ [%{&ff}]\
	set statusline+=%p%%[%{GetFileSize()}]\ L:%l\ C:%c\
	set statusline+=%{strftime(\"%d/%m/%y\ %H:%M\")}

	" Delete the trailing whitespace automatically.
	autocmd BufWrite * :call DeleteTrailingWS()
endtry


"=========================================================
"                        General
"=========================================================

" Set the leader of the keykeyboard shortcuts
let mapleader=";"
let g:mapleader=";"

" Enable filetype detection and ft specific plugin/indent
filetype on
filetype plugin on

" Enable syntax highlight and completion
syntax enable
syntax on

set nocompatible                      " Set not to be compatible with VI
set noswapfile                        " Disable swapfile
set nobackup                          " Disable the backup file before overwriting
set nowritebackup                     " Disable the backup file before overwriting
set hidden                            " A buffer becomes hidden when it's abandoned
set backspace=indent,eol,start        " More powerfull backspacing
set history=10000                     " Set the history record number to modify the file
set switchbuf=useopen,usetab,newtab   " Specify the behavior when switching between buffers
set magic                             " Turn magic on for the regular expression
set autoread                          " Read automatically it when a file is changed from the outside
set viminfo^=%                        " Remember information about open buffers on close
set noerrorbells                      " Disable the bells for error messages
set novisualbell                      " Disable visual bell instead of beeping
set whichwrap+=<,>

" Ignore some files or directories
set wildignore+=*/tmp/*,*.swp,*.zip,.DS_Store,*#,*~,   " Unix/Linux/MacOS
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,           " Windows
set wildignore+=*s.so,*.o,*.a,*.obj,*.exe,*.so,*.dll,  " C/C++
set wildignore+=*.pyc,*.pyo,                           " Python
set wildignore+=.git,.hg,.svn,                         " SVC

" Detect file encoding
set fileencodings=utf-8,gb18030,cp936,latin1
if has("win32")
    set fileencoding=chinese
    set encoding=gbk
else
    set fileencoding=utf-8
    set encoding=utf-8
endif

" Solve the menu messy code
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set langmenu=zh_CH.utf-8

" Solve the command line messy code.
"language message zh_CN.utf-8

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if !exists("g:leave_my_cursor_position_alone") |
    \       if line("'\"") > 0 && line("'\"") <= line("$") |
    \           exe "normal g'\"" |
    \       endif |
    \ endif

" Reload .vimrc automatically when changing and saving it.
"autocmd BufWritePost $MYVIMRC source $MYVIMRC


"=========================================================
"                         VIM UI
"=========================================================

" Color Scheme
set t_Co=256
set background=dark
color desert

" Highlight
set cursorline              " Highlight the cursor line
set colorcolumn=80,100,120  " Highlight the columns

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Editor Settings
set foldcolumn=1            " Add a bit extra margin to the left
set wildmenu                " Turn on the wild menu
set ruler                   " Always show current position
set nofoldenable            " Disable folding
set confirm                 " Prompt when existing from an unsaved file
set report=0                " Always report number of line changed
set nowrap                  " Don't wrap lines
set scrolloff=5             " Set 5 lines above/below cursor when scrolling
set laststatus=2            " Use 2 lines for the status bar
set number                  " Show line number
set showcmd                 " Show typed command in status bar
set title                   " Show file in titlebar
set showmatch               " Show matching bracket(briefly jump)
set matchtime=2             " Show matching bracket for 0.2 seconds
set matchpairs+=<:>         " Specially for HTML.
set nolinebreak             " Disable line break when the text exceeds textwidth

" Default Indentation and TAB
filetype indent on
set textwidth=0            " Disable that the longer line is broken when inserted
set shiftwidth=4           " Indent width
set softtabstop=4          " The width for BACKSPACE to delete
set tabstop=4              " Tab width to display
set autoindent
set smartindent
set smarttab
set expandtab

" Fold code
set nofoldenable           " Disable the fold mode when vim starts
set foldmethod=syntax      " The fold type, such as indent or syntax

" Tab Line
set showtabline=2          " Always show the tab line.

" The specific setting for the specific type file
autocmd FileType coffee,javascript,html,xhtml,htm,css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType h,c,hpp,cc,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab


"=========================================================
"                     GUI Settings
"=========================================================
if has("gui_running")
    set guioptions=aAce            " Remove toolbar
    set guioptions+=mgriR          " Display menubar, scrollbar

    set guifont=DejaVuSansMono:h12,Monospace:h12,Courier\ New:h14
    set guitablabel=%M\ %t
    set columns=120
    set lines=40

    noremap <D-M-Left> :tabprevious<CR>
    noremap <D-M-Right> :tabnext<CR>
endif


"=========================================================
"                     Key Bindings
"=========================================================

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>

" Enable the command ":Man" to view the man information.
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

" Remove the Windows ^M when the encodings gets messed up.
noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Copy the selected text to clipboard
vnoremap <Leader>y "+y

" Paste the text in the clipboard to vim
nmap <Leader>p "+p

" Remap VIM 0 to first non-blank character
map 0 ^

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
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap nw <C-W><C-W>
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l


" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Jump between the brackets.
nmap <Leader>M %

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Map <Ctrl>+F12 to ctags.
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


"=========================================================
"                    Some Functions
"=========================================================

" Download and install the plugins.
func! DownloadPlugins()
    if empty(glob('~/.vim/plugins.vim'))
        silent !curl -fLo ~/.vim/plugins.vim --create-dirs
            \ https://raw.githubusercontent.com/xgfone/dot-vimrc/xgfone/plugins.vim
        source ~/.vim/plugins.vim
    endif
endfunc
command! DownloadPlugins call DownloadPlugins()


func! GetCurrentFileDir(cmd)
        return a:cmd . " " . expand("%:p:h") . "/"
endfunc


func! GetFileSize()
        let bytes = getfsize(expand("%:p"))

        if bytes <= 0
                return ''
        endif

        if bytes < 1024
                return bytes . 'B'
        else
                return (bytes / 1024) . 'kB'
        endif
endfunc


" Delete the trailing writespace.
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


" Replace the string accurately.
"
"   confirm: Whether to confirm or not before replacing.
"   wholeword: Whether to match the whole word or not.
"   replace: the string to be replaced.
func! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunc

" Not Confirm & Not WholeWord
nnoremap <Leader>rnn :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>

" Not Confirm & WholeWord
nnoremap <Leader>rcn :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>R   :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" Confirm & Not WholeWord
nnoremap <Leader>rnw :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>

" Confirm & WholeWord
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

