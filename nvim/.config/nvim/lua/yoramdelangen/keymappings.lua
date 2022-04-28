local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Changing the leader
keymap('n', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear any highlighting on search etc.
keymap('n', '<C-l>', '<cmd>nohls<cr>', opts)

-- better window movement
-- keymap('n', '<A-h>', '<C-w>h', opts)
-- keymap('n', '<A-j>', '<C-w>j', opts)
-- keymap('n', '<A-k>', '<C-w>k', opts)
-- keymap('n', '<A-l>', '<C-w>l', opts)

keymap('n', '<C-Bslash>', '<cmd>vsplit<cr> <C-w>l', opts)
keymap('n', '<C-Bar>', '<cmd>split<cr> <C-w>k', opts)

-- be a JUMPER
-- START USING DEFAULT NAVIGATION/JUMPING NOOB!!
-- keymap('', '<C-k>', '10k', opts)
-- keymap('', '<C-j>', '10j', opts)

-- Faster fingers
keymap('i', 'jk', '<esc>', opts)

-- close current buffer and move around buffers
keymap('n', '<C-q>', '<cmd>BufDel<cr>', opts)
keymap('n', '<C-S-Q>', '<cmd>BufDel!<cr>', opts)
keymap('n', '<C-]>', '<cmd>bnext<cr>', opts)
keymap('n', '<C-[>', '<cmd>bprev<cr>', opts)

-- keep visual indentation
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- jump between brackets, blockqoutes etc..
keymap('n', '<leader>q', '%', opts)

-- Stop big fingers from doing dum stuff
keymap('n','Q', '<nop>', opts)
keymap('n','q', '<nop>', opts)
keymap('n','qq', '<nop>', opts)

-- Moving line up
-- keymap('v', '<C-A-j>', ':m .+1<cr>==', opts)
-- keymap('v', '<C-A-k>', ':m .-2<cr>==', opts)
-- keymap('n', '<C-A-j>', ':m .+1<cr>==', opts)
-- keymap('n', '<C-A-k>', ':m .-2<cr>==', opts)

-- Copy and paste from clipboard
keymap('', '<leader>y', '"*y', opts)
keymap('', '<leader>Y', '"+y', opts)
keymap('', '<leader>p', '"*p', opts)
keymap('', '<leader>P', '"+p', opts)

keymap('v', 'p', '"_dP', opts) -- keep value in the register

-- goto outside the current method on a newline
keymap('n', '<leader>}', 'ysiw}', opts)
