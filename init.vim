set nocompatible 
filetype off
filetype plugin on

syntax on
set number
set tabstop=2
set shiftwidth=2
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

au BufNewFile,BufRead *.ejs set filetype=html

nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <c-y> <Plug>(Yanks)

nnoremap <leader>e :Telescope file_browser theme=dropdown<CR>
nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=dropdown<cr>
nnoremap <leader>fb <cmd>Telescope buffers theme=dropdown<cr>
nnoremap <leader>fh <cmd>Telescope help_tags theme=dropdown<cr>
nnoremap <leader>ts <cmd>Telescope tmux sessions theme=dropdown<cr>
nnoremap <leader>tw <cmd>Telescope tmux windows theme=dropdown<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-emmet']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'camgraff/telescope-tmux.nvim'
Plug 'NickyTope/yanks.nvim'
Plug 'tanvirtin/monokai.nvim'

call plug#end()

lua << EOF
require("lualine").setup() 
require("telescope").setup()
require("telescope").load_extension "file_browser"
require("telescope").load_extension "tmux"
EOF

colorscheme monokai
