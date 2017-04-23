set nocompatible              " be iMproved, required
filetype off                  " required

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" set cursor line in current window only
augroup CursorLineOnlyInActiveWindow
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to Space because the backslash is too far away
" That means all \x commands turn into " x"
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader="\<Space>"
let maplocalleader="\\"


" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*pyc
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.so,*.swp,*.zip,*.gz,*.tar

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================  Terminal Setup ========================
" sets term to fix tmux problems

if !has('gui_running')
  set term=screen-256color
  set term=xterm-256color
endif

set number
set t_Co=256
set encoding=utf-8
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

" ================ Custom Settings ========================

if filereadable(expand("~/.vim/settings.vim"))
  source ~/.vim/settings.vim
endif

colorscheme solarized
if has('gui_running')
  " open in fullscreen mode
  " set fuoptions=maxvert,maxhorz
  " au GUIEnter * set fullscreen
else
  set background=dark
endif

" General editing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>\ :vspl<CR>
nnoremap <Leader>= :spl<CR>

" clear search highlight with Enter
nnoremap <CR> :noh<CR><CR>

" Yank to clipboard (on Mac install https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
set clipboard=unnamed

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd ~ | endif

