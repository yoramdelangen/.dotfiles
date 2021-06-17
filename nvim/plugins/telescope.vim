lua <<EOF
-- Register Telescope and it's configuration
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '$ ',
    color_devicons = true,
    file_ignore_patterns = {
      "node_modules/.*",
      ".git/.*"
    }
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

require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('project')
EOF

nnoremap <C-p> <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp :Telescope project<cr>
