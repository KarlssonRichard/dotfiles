set nocompatible 
filetype off  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax on
set number
set tabstop=4
set shiftwidth=4
set backspace=2

set nobackup
set nowritebackup
set noswapfile

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'

call vundle#end() 
filetype plugin indent on
