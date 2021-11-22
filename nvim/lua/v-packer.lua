local fn = vim.fn
-- Auto install Packer
if fn.empty(fn.glob(install_path)) > 0 then
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'

end
-- Performance improvement by compiling packer package??
vim.api.nvim_exec([[
  augroup Packer
    autocmd BufWritePost v-packer.lua PackerCompile
    autocmd!
  augroup end
]], false)

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file manager
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Improving movement around
  use 'phaazon/hop.nvim'

  -- LSP and editorconfig (spacing and identation)
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'editorconfig/editorconfig-vim'
  -- use 'glepnir/lspsaga.nvim' -- not LUA
  use 'prettier/vim-prettier'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use "hrsh7th/vim-vsnip" -- no Lua
  use {"hrsh7th/vim-vsnip-integ", opt = true} -- no Lua

  -- use 'rafamadriz/friendly-snippets'
  -- use 'b3nj5m1n/kommentary' -- NO Lua
  -- use 'numToStr/Comment.nvim'
  use { 'echasnovski/mini.nvim', branch = 'stable' }

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "windwp/nvim-ts-autotag"

  -- THEMING
  -- use 'joshdick/onedark.vim'         -- Theme inspired by Atom
  -- use 'itchyny/lightline.vim'        -- Fancier statusline
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use 'romgrk/barbar.nvim'
  use 'folke/which-key.nvim'
  use 'Shatur/neovim-ayu'

  -- LANGUAGERS
  use 'jwalton512/vim-blade'

  -- Terminal usage
  -- use "numtostr/FTerm.nvim"

  -- Profilers
  use 'henriquehbr/nvim-startup.lua'

  -- Tools/Apps
  use 'vimwiki/vimwiki'
  use 'akinsho/toggleterm.nvim'
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- TODO: Install the following:
  -- https://github.com/norcalli/nvim-colorizer.lua
  --
  -- @@ LATERS
  -- nvcdeo-color-schemas -- awesome color schemas
  -- nvim galaxyline -- tmux-ish statusline for nvim
  -- nvim barbar/bufferline
  -- https://github.com/glepnir/dashboard-nvim
  --
end)
