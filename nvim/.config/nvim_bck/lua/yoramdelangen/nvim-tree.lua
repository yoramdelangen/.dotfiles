vim.g.nvim_tree_refresh_wait = 500

require'nvim-tree'.setup({
  open_on_setup = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = true,
  create_in_closed_folder = true,
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
  },
  renderer = {
    add_trailing = true,
    highlight_opened_files = 'all',
    icons = {
      symlink_arrow = ' >> ',
      show = {
        git = true,
        folder = true,
        file = false,
        folder_arrow = true
      }
    },
  }
})

-- Keymappings
local options = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<C-k><C-f>', '<cmd>NvimTreeFindFile<CR>', options)
