-- Set leader
key_bind('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- better window movement
key_bind('n', '<C-h>', '<C-w>h', {silent = true})
key_bind('n', '<C-j>', '<C-w>j', {silent = true})
key_bind('n', '<C-k>', '<C-w>k', {silent = true})
key_bind('n', '<C-l>', '<C-w>l', {silent = true})

-- quicker movement
key_bind('n', '<C-A-j>', '<cmd>+10<cr>', {silent=true})
key_bind('n', '<C-A-k>', '<cmd>-10<cr>', {silent=true})

-- improve identation
key_bind('v', '>', '>gv')
key_bind('v', '<', '<gv')

-- No Highlight
key_bind('n', '<leader>hc', '<cmd>nohls<cr>', {silent=true})

-- buffer and tab movement (replaced with barbar)
-- key_bind('n', '<tab>', '<cmd>tabnext<cr>', {noremap=true})
-- key_bind('n', '<s-tab>', '<cmd>tabprev<cr>', {noremap=true})
-- key_bind('n', '<C-]>', '<cmd>tabnext<cr>', {noremap=true})
-- key_bind('n', '<C-[>', '<cmd>tabprev<cr>', {noremap=true})

-- " No recording, its not AVG PROOFFF!
key_bind('n', 'Q', '<nop>', {noremap=true})
key_bind('n', 'q', '<nop>', {noremap=true})
key_bind('n', 'qq', '<nop>', {noremap=true})

-- " change escape key to jj
key_bind('i', '<C-c>', '<esc>', {noremap=true})
key_bind('i', 'jk', '<esc>', {noremap=true})
key_bind('i', 'kj', '<esc>', {noremap=true})

-- Improve DD not to yank
--key_bind('n', 'dd', '"_dd', {noremap=true})
--key_bind('n', 'D', '"_D', {noremap=true})

-- Easier Copy pasta
key_bind('n', 'Y', 'y$', {noremap=true, silent=true})

key_bind('', '<leader>y', '"*y')
key_bind('', '<leader>Y', '"+y')
key_bind('', '<leader>p', '"*p')
key_bind('', '<leader>P', '"+p')

--[[ noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p ]]

-- Prettier formatter
key_bind('n', '<C-S-p>', '<cmd>Prettier', {noremap=true})
key_bind('n', '<C-S-ENTER>', '<cmd>Prettier', {noremap=true})

-- REFERENCES
-- Helpers for setup proper keybindings:
-- https://github.com/nanotee/nvim-lua-guide#defining-mappingsv
