local fn = vim.fn
local install_path = fn.stdpath('data')..'/packer/packer.nvim'

-- Auto install Packer
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } 

  -- install LSP to help us properly
  use 'neovim/nvim-lspconfig'
 
  -- AUTOCOMPLETE & SNIPPETS
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'xiyaowong/telescope-emoji.nvim'
  use 'cljoly/telescope-repo.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- UI elements
  use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" }}
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- file manager
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

end)
