"command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | read !sh <args>
nnoremap <Leader>r :!sh %<CR>
nnoremap <Leader>R :R %<CR>
