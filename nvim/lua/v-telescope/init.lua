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
      ".git/.*",
      ".DS_Store"
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
  }
}

telescope.load_extension('fzy_native') 

key_bind('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files({ hidden=true, no_ignore=true })<cr>', {silent=true, noremap=true})
key_bind('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {silent=true, noremap=true})
key_bind('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {silent=true, noremap=true})
key_bind('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {silent=true, noremap=true})
