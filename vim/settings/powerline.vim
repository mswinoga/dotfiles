
" Powerline
if has('python3')
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
else
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
endif

let g:Powerline_symbols = 'fancy'
" always show statusbar
set laststatus=2

