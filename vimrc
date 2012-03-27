
call pathogen#infect() 

" Enable syntax highlighting
syntax on

" size of a tab
set tabstop=2

" size of an "indent"
set shiftwidth=2

" always uses spaces instead of tab characters
set expandtab

" Set leader to ,
let mapleader = ","

" Show menu of files when autocompleting
set wildmenu


source ~/.vim/keybindings.vim
source ~/.vim/ctrlp_config.vim
