set nocompatible 
filetype off
filetype plugin on
syntax on

set number
set tabstop=2
set shiftwidth=2
set backspace=2
set path+=**
set wildmenu
set laststatus=0
set nobackup
set nowritebackup
set noswapfile
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('termguicolors')
	set termguicolors
endif

au BufNewFile,BufRead *.ejs set filetype=html

" Keybinds
nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <leader>y <Plug>(Yanks)
nnoremap <leader>f <cmd>lua require('fzf-lua').files()<CR>

" This will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'jiangmiao/auto-pairs'                 " This will auto close ( [ {
Plug 'echasnovski/mini.nvim'                " Statusline
Plug 'NickyTope/yanks.nvim'                 " Yank history
Plug 'tanvirtin/monokai.nvim'               " Colorscheme
Plug 'ibhagwan/fzf-lua', {'branch': 'main'} " Fuzzy search

call plug#end()

lua << EOF
require("mini.statusline").setup()
EOF

colorscheme monokai
