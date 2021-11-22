--[[
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_close = O.auto_close_tree -- 0 by default, closes the tree when it's the last window

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
]]

-- vim.g.nvim_tree_ignore = {  } -- empty by default
-- vim.g.nvim_tree_auto_ignore_ft = {'startify','vimwiki'} --empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_gitignore = 0 -- 0 by default

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
    folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
}

require'nvim-tree'.setup({
  auto_close = true,
  open_on_tab = true,
  open_on_setup = true,
  view = {
    side = 'right',
    auto_resize = true
  },
  filters = {
    custom = { '.git', '.DS_Store', '.cache' }
  }
})

local options = { silent = true }
-- Keymappings
key_bind('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>', options)
key_bind('n', '<C-k><C-f>', '<cmd>NvimTreeFindFile<CR>', options)
key_bind('n', '<C-k><C-r>', '<cmd>NvimTreeRefresh<CR>', options)

