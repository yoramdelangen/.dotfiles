filetype plugin indent on
syntax on

set cmdheight=2
set encoding=UTF-8
set number relativenumber
set clipboard=unnamed
set shiftwidth=2 autoindent smartindent tabstop=4 softtabstop=4 expandtab
""set nocursorline
"set lazyredraw
set ttyfast

let mapleader = ";"

" Make sure vim-plug is installed
source ~/.config/nvim/vim-plug.vim

"""""""""""""""""""""""""""""""""""""""""""""
" Install plugins
"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Git-ish
Plug 'airblade/vim-gitgutter'

" Telescope 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

source ~/.config/nvim/movement.vim
source ~/.config/nvim/plugins/telescope.vim


