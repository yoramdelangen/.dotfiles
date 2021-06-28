vim.g.kommentary_create_default_mappings = false
vim.g.use_consistent_indentation = true

vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>/", "<Plug>kommentary_visual_default", {})

require('kommentary.config').configure_language("php", {
  single_line_comment_string = "//",
  multi_line_comment_strings = {"/*", "*/"}
}) 
