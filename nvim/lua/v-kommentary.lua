require('Comment').setup({
    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---@type table
    mappings = {
        ---operator-pending mapping
        ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
        basic = true,
        ---extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = false,
        ---extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
    },
})

local ft = require('Comment.ft')
ft.set('php', {'//%s', '/*%s*/'})

-- key_bind('', '<leader>/', "<cmd>lua require('Comment').toggle()<cr>", {noremap = true, silent = true})

--[[ vim.g.kommentary_create_default_mappings = false
vim.g.use_consistent_indentation = true
vim.g.prefer_single_line_comments = true

key_bind("n", "<leader>/", "<Plug>kommentary_line_default", {})
key_bind("n", "<leader>c", "<Plug>kommentary_motion_default", {})
key_bind("v", "<leader>/", "<Plug>kommentary_visual_default", {})

require 'kommentary.config'.configure_language("php", {
  prefer_single_line_comments = true,
  single_line_comment_string = "//",
  multi_line_comment_strings = {"/*", "*/"}
}) ]]
