local telescope  = require 'telescope'
local actions = require 'telescope.actions'
local fzf = {
  fuzzy = true,                    -- false will only do exact matching
  override_generic_sorter = true,  -- override the generic sorter
  override_file_sorter = true,     -- override the file sorter
  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
}
local file_browser = {
  theme = "ivy",
}

telescope.setup {
  extensions = {
    fzf = fzf,
    file_browser = file_browser
  },
  file_ignore_patterns = {
    "node_modules/.*",
    ".git/*",
    ".DS_Store",
    ".idea/*",
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer
        }
      }
    }
  }
}

-- LOADING EXTENSIONS
telescope.load_extension('fzf')
telescope.load_extension('repo')
telescope.load_extension('emoji')
telescope.load_extension('file_browser')

local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope git_files hidden=true<cr>', options)
vim.api.nvim_set_keymap('n', '<C-A-p>', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', options)
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>Telescope buffers<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>lua require "telescope".extensions.file_browser.file_browser()<cr>', options)

vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd Telescope help_tags<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Telescope lsp_document_symbols<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>GR', '<cmd>Telescope lsp_workspace_symbols<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics bufnr=0<cr>', options)
