local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Performance improvement by compiling packer package??
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file manager
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Improving movement around
  use { 'phaazon/hop.nvim', as = 'hop', config = function() require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } end }

  -- LSP and editorconfig (spacing and identation)
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'editorconfig/editorconfig-vim'
  use 'glepnir/lspsaga.nvim' -- not LUA
  use 'prettier/vim-prettier'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'L3MON4D3/LuaSnip'
  use "hrsh7th/vim-vsnip" -- no Lua
  use {"hrsh7th/vim-vsnip-integ", opt = true} -- no Lua

  use 'rafamadriz/friendly-snippets'
  use 'b3nj5m1n/kommentary' -- NO Lua
  
  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {"windwp/nvim-ts-autotag", opt = true}
  use {'andymass/vim-matchup', opt = true}

  -- THEMING
  use 'joshdick/onedark.vim'         -- Theme inspired by Atom
  -- use 'itchyny/lightline.vim'        -- Fancier statusline
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = function () require('lualine').setup() end }
  use 'romgrk/barbar.nvim'
  use 'mhinz/vim-startify'

  -- LANGUAGERS
  use 'jwalton512/vim-blade'

  -- Terminal usage
  -- use "numtostr/FTerm.nvim"

  -- Tools/Apps
  -- use { 'AckslD/nvim-whichkey-setup.lua', requires = {'liuchengxu/vim-which-key'}, }
  use 'vimwiki/vimwiki'

  -- TODO: Install the following:
  -- https://github.com/folke/which-key.nvim
  -- https://github.com/norcalli/nvim-colorizer.lua
  --
  -- @@ LATERS
  -- nvcdeo-color-schemas -- awesome color schemas
  -- nvim galaxyline -- tmux-ish statusline for nvim
  -- nvim barbar/bufferline
  -- https://github.com/glepnir/dashboard-nvim
  --
end)
