
if exists("b:current_syntax")
    finish
endif

syntax match NodeDown "\v^.*node is down.*$"
syntax match NodeUp "\v^.*node is ok.*$"

hi NodeDown term=reverse cterm=reverse ctermfg=1 guifg=White guibg=Red
hi NodeUp term=reverse cterm=reverse ctermfg=2 guifg=White guibg=Green

let b:current_syntax = "nodeup"

