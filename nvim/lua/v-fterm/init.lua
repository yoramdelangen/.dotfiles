local FTerm = require('FTerm')
local Term = require('FTerm.terminal')

FTerm.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})

local opts = { noremap = true, silent = true }

-- Setup commands
local lazygit = Term:new():setup({
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

function _G.__fterm_lazygit()
    lazygit:toggle()
end

key_bind('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>', opts)
key_bind('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

key_bind('n', '<leader>tg', 'v:lua __fterm_lazygit()<CR>', {expr=true, noremap=true})

-- References
-- https://github.com/numToStr/FTerm.nvim
