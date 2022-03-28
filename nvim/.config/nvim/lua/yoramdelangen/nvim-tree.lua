
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
  folder_arrows = 1
}
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_symlink_arrow = ' >> '

require'nvim-tree'.setup({
  open_on_setup = true,
  hijack_cursor = true,
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
    },
    open_file = {
      quit_on_open = true
    }
  }
})

-- Keymappings
local options = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<C-k><C-f>', '<cmd>NvimTreeFindFile<CR>', options)
