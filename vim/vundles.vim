
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" System
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'svermeulen/vim-easyclip'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'powerline/powerline'

" Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'

" General editing
Plugin 'terryma/vim-expand-region'
Plugin 'Raimondi/delimitMate'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'

Plugin 'Valloric/YouCompleteMe'
" Plugin 'marijnh/tern_for_vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

