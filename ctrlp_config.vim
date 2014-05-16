set wildignore+=*.so,*.swp,*.zip  " MacOSX/Linux

let g:ctrlp_by_filename = 1

" Ignore files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Open files in new tab with enter
"let g:ctrlp_prompt_mappings = {
"  \ 'AcceptSelection("e")': [],
"  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
"  \ }

