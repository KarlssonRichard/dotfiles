set nocompatible 
filetype off  
filetype plugin on

syntax on
set number
set tabstop=4
set shiftwidth=4
set backspace=2

set laststatus=0
set nobackup
set nowritebackup
set noswapfile
set termguicolors
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme one

call plug#begin()
Plug 'rakr/vim-one'
call plug#end()

" Plugin Manager   :PlugInstall
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" neovim path - ~/.config/nvim/init.vim
" path to colorschemes /home/{USER}/.config/nvim/colors
