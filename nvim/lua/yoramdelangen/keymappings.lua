local options = { noremap = true, silent = true }

-- Changing the leader
vim.api.nvim_set_keymap('n', '<space>', '<nop>', options)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear any highlighting on search etc.
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>nohls', options)

-- better window movement
vim.api.nvim_set_keymap('n', '<C-S-h>', '<C-w>h', options)
vim.api.nvim_set_keymap('n', '<C-S-j>', '<C-w>j', options)
vim.api.nvim_set_keymap('n', '<C-S-k>', '<C-w>k', options)
vim.api.nvim_set_keymap('n', '<C-S-l>', '<C-w>l', options)

vim.api.nvim_set_keymap('n', '<C-Bslash>', '<cmd>vsplit<cr> <C-w>l', options)
vim.api.nvim_set_keymap('n', '<C-Bar>', '<cmd>split<cr> <C-w>k', options)

-- be a JUMPER
vim.api.nvim_set_keymap('', '<C-k>', '10k', options)
vim.api.nvim_set_keymap('', '<C-j>', '10j', options)

-- close current buffer and move around buffers
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>bdelete<cr>', options)
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>tabnext<cr>', options)
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>tabprev<cr>', options)

-- keep visual indentation
vim.api.nvim_set_keymap('', '>', '>gv', options)
vim.api.nvim_set_keymap('', '<', '<gv', options)

-- jump between brackets, blockqoutes etc..
vim.api.nvim_set_keymap('n', '<leader>q', '%', options)

-- Stop big fingers from doing dump stuff
vim.api.nvim_set_keymap('n','Q', '<nop>', options)
vim.api.nvim_set_keymap('n','q', '<nop>', options)
vim.api.nvim_set_keymap('n','qq', '<nop>', options)

-- Moving line up
vim.api.nvim_set_keymap('v', '<C-A-j>', ':m .+1<cr>==', options)
vim.api.nvim_set_keymap('v', '<C-A-k>', ':m .-2<cr>==', options)
vim.api.nvim_set_keymap('n', '<C-A-j>', ':m .+1<cr>==', options)
vim.api.nvim_set_keymap('n', '<C-A-k>', ':m .-2<cr>==', options)

-- Copy and paste from clipboard
vim.api.nvim_set_keymap('', '<leader>y', '"*y', options)
vim.api.nvim_set_keymap('', '<leader>Y', '"+y', options)
vim.api.nvim_set_keymap('', '<leader>p', '"*p', options)
vim.api.nvim_set_keymap('', '<leader>P', '"+p', options)
