vim.g.kommentary_create_default_mappings = false
vim.g.use_consistent_indentation = true
vim.g.prefer_single_line_comments = true

key_bind("n", "<leader>/", "<Plug>kommentary_line_default", {})
key_bind("n", "<leader>c", "<Plug>kommentary_motion_default", {})
key_bind("v", "<leader>/", "<Plug>kommentary_visual_default", {})

require 'kommentary.config'.configure_language("php", {
  prefer_single_line_comments = true,
  single_line_comment_string = "//",
  multi_line_comment_strings = {"/*", "*/"}
}) 
