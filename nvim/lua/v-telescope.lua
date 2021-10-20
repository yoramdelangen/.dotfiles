local telescope = require('telescope')
local actions = require('telescope.actions')

-- MORE CAN BE FOUND HERE:
-- https://github.com/nvim-telescope/telescope.nvim#getting-started

-- Register Telescope and it's configuration
telescope.setup {
  defaults = {
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '$ ',
    color_devicons = true,
    file_ignore_patterns = {
      "node_modules/.*",
      ".git/*",
      ".DS_Store",
      ".idea/*",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      theme = "dropdown"
    },
    find_files = {
      theme = "dropdown"
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('fzf') 

local opts = {silent = true, noremap=true}
key_bind('n', '<C-p>', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', opts)
key_bind('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
key_bind('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
key_bind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
key_bind('n', 'gr', '<cmd>Telescope lsp_document_symbols<cr>', opts)
key_bind('n', 'GR', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
key_bind('n', '<leader>dd', '<cmd>Telescope lsp_document_diagnostics<cr>', opts)

