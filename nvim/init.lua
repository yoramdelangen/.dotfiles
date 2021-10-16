CONFIG_PATH = vim.fn.stdpath('config')

require('helpers')

-- Global defined variable for quick config
vim.cmd('luafile '..CONFIG_PATH..'/lua/v-settings.lua')
vim.cmd('lcd %:p:h') -- set working directory to open file/folder

-- Basics stuff
require('settings')
require('plugins')
require('keymappings')

-- Load Plugins
require('v-nvimtree')
require('v-treesitter')
require('v-telescope')
require('v-lsp')
require('v-kommentary')
require('v-vimwiki')
require('v-hop')

-- Fancy things up
require('v-theming')
require('v-barbar')

-- Loading GUI stuff
if vim.g.neovide then
  require('v-gui/neovide')
end

-- REFERENCES
-- https://github.com/glepnir/nvim
-- https://github.com/ChristianChiarulli/LunarVimPrevious
-- https://github.com/neovim/nvim-lspconfig/wiki/Complete-init.lua-example
-- https://oroques.dev/notes/neovim-init/#commands-and-autocommands
