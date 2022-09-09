
filetype plugin indent on

call pathogen#infect() 

source ~/.vim/config.vim
source ~/.vim/keybindings.vim
source ~/.vim/xptemplate_config.vim
source ~/.vim/ctrlp_config.vim
source ~/.vim/syntastic_config.vim

if has("gui_macvim")
    au GUIEnter * set guifont=Monaco:h16
else
    au GUIEnter * set guifont=Hack\ 12
endif

