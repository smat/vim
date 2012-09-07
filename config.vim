" Enable syntax highlighting
syntax on

" size of a tab
set tabstop=8

" size of an "indent"
set shiftwidth=2
set autoindent

" always uses spaces instead of tab characters, and set size of space-tab
set expandtab
set softtabstop=2

" Show pretty tabs
set list
set listchars=tab:>-,precedes:<,extends:>,trail:~

" Set leader to ,
let mapleader = ","

" Show menu of files when autocompleting
set wildmenu
set wildmode=longest,list

" Change to tab instead of open in same tab if already opened in tab
set switchbuf=usetab

" Show line number and ruler
set number
set ruler

" Always keep a couple of lines above/below curser
set scrolloff=3

" Always show status line
set laststatus=2

" Turn on autocomplete
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,preview,longest

" Use built-in autocomplete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Change statusline to something better
"set statusline=%t\ %y\ format:\ %{&ff};\ %{fugitive#statusline()}

" Do not show toolbar in MacVim
if has("gui_running")
    set guioptions=egmrt
endif
