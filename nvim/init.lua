CONFIG_PATH = vim.fn.stdpath('config')

require('v-utils/helpers')
require('v-utils/reload')

-- Global defined variable for quick config
vim.cmd('lcd %:p:h') -- set working directory to open file/folder

-- Basics stuff
require('v-settings')
require('v-keymappings')
require('v-packer')

-- Load Plugins
require('v-nvimtree')
require('v-treesitter')
require('v-telescope')
require('v-lsp')
require('v-kommentary')
require('v-hop')
require('v-which-key')
require('v-gitsigns')

-- Fancy things up
require('v-lualine')
require('v-theming')
require('v-barbar')

-- apps
require('v-vimwiki')
require('v-trouble')
require('v-toggleterm')

-- Loading GUI stuff
if vim.g.neovide then
  require('v-gui/neovide')
end

-- REFERENCES
-- https://github.com/glepnir/nvim
-- https://dev.to/voyeg3r/my-ever-growing-neovim-init-lua-h0p
-- https://github.com/ChristianChiarulli/LunarVimPrevious
-- https://github.com/neovim/nvim-lspconfig/wiki/Complete-init.lua-example
-- https://oroques.dev/notes/neovim-init/#commands-and-autocommands
