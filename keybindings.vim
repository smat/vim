
map <silent> <D-M-Left> :tabp<CR>
map <silent> <D-M-Right> :tabn<CR>

set pastetoggle=<f2>
noremap <silent> <f5> :NERDTreeMirror<cr>
noremap <silent> <f6> :NERDTreeToggle<cr>
noremap <silent> <f7> :NERDTreeFind<cr>
noremap <silent> <tab> :BufExplorer<cr>
noremap <silent> <s-tab> :MBEFocus<cr>

nnoremap <leader>a :Ack
nnoremap <silent> <leader>b :MBEFocus<cr>
nnoremap <silent> <leader>t :MBEToggle<cr>

vmap <f3> "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nmap <f3> vip<f3>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
