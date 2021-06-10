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

" Sidebar/Tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

call plug#end()

