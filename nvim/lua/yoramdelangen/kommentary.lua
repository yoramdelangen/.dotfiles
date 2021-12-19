-- KOMMENTARY
local kommentary = require 'kommentary.config'

vim.g.kommentary_create_default_mappings = false

key_bind('n', 'gc', '<Plug>kommentary_line_default', {})
key_bind('x', 'gc', '<Plug>kommentary_visual_default', {})
key_bind('x', 'gcc', '<Plug>kommentary_visual_default<C-c>', {})

kommentary.configure_language('default', {
  prefer_single_line_comments = true,
  use_consistent_indentation = true
})

kommentary.configure_language('php', {
  prefer_single_line_comments = true,
  single_line_comment_string = '//',
  multi_line_comment_strings = {'/*', '*/'}
})

