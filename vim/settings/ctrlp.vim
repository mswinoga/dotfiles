
nmap <Leader>o :CtrlPMixed<CR>
nmap <Leader>O :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

