
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
  folder_arrows = 1
}
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_symlink_arrow = ' >> '

require'nvim-tree'.setup({
  auto_close = true,
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = true,
  hijack_unnamed_buffer_when_opening = true,
  filters = {
    dotfiles = false,
    custom = { '.git', '.DS_Store', '.cache' }
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    change_dir = {
      enable = false
    }
  }
})

-- Keymappings
local options = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<C-k><C-f>', '<cmd>NvimTreeFindFile<CR>', options)
