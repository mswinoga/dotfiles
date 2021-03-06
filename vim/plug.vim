" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/plugged'
  execute '!mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" System
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'svermeulen/vim-easyclip'
" vim-easyclip binds 'move' to 'm', rebind 'add mark' to gm
nnoremap gm m

Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'bps/vim-textobj-python'
Plug 'junegunn/goyo.vim'
let g:goyo_width=120
nnoremap <leader>z :Goyo<CR>

Plug 'blueyed/vim-diminactive'
"DimInactiveOn

"--------------------------------------------------
" Nerdtree
"--------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

map <C-t> :NERDTreeToggle<CR>
" Close vim if of only NERD is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"--------------------------------------------------
" ctrlp
"--------------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
nmap <Leader>o :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>O'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]dist$',
      \ 'file': '\v\.(exe|so|dll|gz)$'
      \ }

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | enew | exe 'CtrlP' 


"--------------------------------------------------
" fugitive
"--------------------------------------------------
Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete

" General editing
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"--------------------------------------------------
" delimitMate
"--------------------------------------------------
Plug 'Raimondi/delimitMate'


"--------------------------------------------------
" syntastic
"--------------------------------------------------
Plug 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["scala"] }
nnoremap <Leader>s :SyntasticCheck<CR>


"--------------------------------------------------
" Supertab - enhanced tab behavior based on context
"--------------------------------------------------
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = '<C-n>'


"--------------------------------------------------
" YouCompleteMe
"--------------------------------------------------
"Plug 'Valloric/YouCompleteMe', { 'on': [] }
"let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:ycm_key_list_accept_completion = ['<C-y>']
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_semantic_triggers = {
"     \ 'elm' : ['.'],
"     \}
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"--------------------------------------------------
" ultisnips
"--------------------------------------------------
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets'

" Prevent UltiSnips from removing our carefully-crafted mappings.
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME . '/.vim/ultisnips',
      \ $HOME . '/.vim/ultisnips-private'
      \ ]


"--------------------------------------------------
" autocomplete
"--------------------------------------------------
if has('autocmd')
  augroup load_us_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
          \| autocmd! load_us_ycm
  augroup END
endif


" JavaScript
"--------------------------------------------------
" vim-javascript-syntax
"--------------------------------------------------
Plug 'jelera/vim-javascript-syntax'


"--------------------------------------------------
" vim-javascript
"--------------------------------------------------
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


"--------------------------------------------------
" vim-indent-guides
"--------------------------------------------------
Plug 'nathanaelkane/vim-indent-guides'


" JSON
"--------------------------------------------------
" vim-json
"--------------------------------------------------
Plug 'elzr/vim-json'


" elm
"--------------------------------------------------
" elm.vim
"--------------------------------------------------
Plug 'elmcast/elm-vim'
let g:elm_format_autosave = 0
let g:elm_syntastic_show_warnings = 1
let g:elm_setup_keybindings = 1
augroup ElmGroup
  autocmd!
  autocmd filetype elm nnoremap <buffer> <LocalLeader>x :!elm make % --output %:r.js; elm run %:r.js<CR>
  autocmd filetype elm nnoremap <buffer> <LocalLeader>f :ElmFormat<CR>
augroup END


call plug#end()            " required

