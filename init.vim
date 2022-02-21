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
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('termguicolors')
	set termguicolors
endif

colorscheme monokai

au BufNewFile,BufRead *.ejs set filetype=html

:nmap <space>e <Cmd>CocCommand explorer<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin('~/.config/nvim/autoload/plugged')
    
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-explorer', 'coc-emmet']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()
