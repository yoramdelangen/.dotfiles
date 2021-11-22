--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2

vim.cmd[[colorscheme ayu-mirage]]

local NONE = 'None'
require('ayu').setup({
  overrides = {
    Normal = { bg = NONE },
    -- ColorColumn = { bg = NONE },
    -- CursorColumn = { bg = NONE },
    -- CursorLine = { bg = NONE },
    -- CursorLineNr = { bg = NONE }
  }
})

-- Icons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

