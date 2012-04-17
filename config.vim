" Enable syntax highlighting
syntax on

" size of a tab
set tabstop=8

" size of an "indent"
set shiftwidth=2

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

" Show line number and ruler
set number
set ruler

" Always keep a couple of lines above/below curser
set scrolloff=3

" Always show status line
set laststatus=2

" Change statusline to something better
"set statusline=%t\ %y\ format:\ %{&ff};\ %{fugitive#statusline()}

" Do not show toolbar in MacVim
if has("gui_running")
    set guioptions=egmrt
endif
