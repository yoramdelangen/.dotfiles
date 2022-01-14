local options = { silent = true, noremap = true }

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
  folder_arrows = 1
}
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_symlink_arrow = ' >> '

-- vim.g.nvim_tree_icons = {
--     default = 'Óòí',
--     symlink = 'ÔíÅ',
--     git = { unstaged = "ÔëÑ", staged = "‚úì", unmerged = "Óúß", renamed = "‚ûú", untracked = "ÔÖá" },
--     folder = { default = "Óóø", open = "Óóæ", empty = "ÔÑî", empty_open = "ÔÑï", symlink = "ÔíÇ" }
-- }

require'nvim-tree'.setup({
  auto_close = true,
  open_on_tab = true,
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = true,
  view = {
    side = 'right',
    auto_resize = true
  },
  filters = {
    custom = { '.git', '.DS_Store', '.cache' }
  }
})

-- Keymappings
vim.api.nvim_set_keymap('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<C-k><C-f>', '<cmd>NvimTreeFindFile<CR>', options)
vim.api.nvim_set_keymap('n', '<C-k><C-r>', '<cmd>NvimTreeRefresh<CR>', options)
