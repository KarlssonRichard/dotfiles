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
set nobackup
set nowritebackup
set noswapfile
set nowrap
set background=dark
set laststatus=2
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
nnoremap <leader>b :!cmake --build build/.<CR>
nnoremap <leader>t <C-]>
nnoremap <leader>tt <C-t>
nnoremap <leader>s :ts<CR>
nnoremap <silent> <esc><esc> :noh<return>

" This will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'jiangmiao/auto-pairs'                 " This will auto close ( [ {
Plug 'ojroques/nvim-hardline'               " Statusline
Plug 'NickyTope/yanks.nvim'                 " Yank history
Plug 'p00f/alabaster.nvim'                  " Colorscheme
Plug 'ibhagwan/fzf-lua', {'branch': 'main'} " Fuzzy search
Plug 'williamboman/mason.nvim'              " Package manager for LSP 
Plug 'williamboman/mason-lspconfig.nvim'    " Bridge between mason and lspconfig
Plug 'neovim/nvim-lspconfig'                " Config LSP
Plug 'stevearc/aerial.nvim'                 " Outline window for quick navigation

call plug#end()

lua << EOF
require("hardline").setup {}
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "clangd" },
}
require("lspconfig").clangd.setup {}

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "C-j", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "C-k", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")

EOF

colorscheme alabaster
