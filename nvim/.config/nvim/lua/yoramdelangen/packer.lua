local fn = vim.fn
local install_path = fn.stdpath('data')..'/packer/packer.nvim'

-- Auto install Packer
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'windwp/nvim-ts-autotag'

  -- install LSP to help us properly
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- AUTOCOMPLETE & SNIPPETS
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'github/copilot.vim'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'xiyaowong/telescope-emoji.nvim'
  use 'cljoly/telescope-repo.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Harpoon
  use 'ThePrimeagen/harpoon'
  use 'ggandor/lightspeed.nvim'

  -- UI elements
  use 'norcalli/nvim-base16.lua'
  use 'ellisonleao/gruvbox.nvim'
  use { 'catppuccin/nvim', as='catppuccin' }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}

  -- file manager
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Note taking
  use 'jakewvincent/mkdnflow.nvim'
  use 'jubnzv/mdeval.nvim'

  -- Helpers
  use 'b3nj5m1n/kommentary'
  use 'folke/todo-comments.nvim'

  -- Extensions that help NVIM from doing stupid stuff
  use 'ojroques/nvim-bufdel'

  -- StatusLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
