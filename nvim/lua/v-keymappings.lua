-- Set leader
bind_n('<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- better window movement
bind_n('<C-h>', '<C-w>h', {silent = true})
bind_n('<C-j>', '<C-w>j', {silent = true})
bind_n('<C-k>', '<C-w>k', {silent = true})
bind_n('<C-l>', '<C-w>l', {silent = true})

-- quicker movement
key_bind('', '<C-A-k>', '10k', {silent=true})
key_bind('', '<C-A-j>', '10j', {silent=true})

-- Moving text more easily:
-- move visual selection
bind_v('J', ':m .+1<cr>gv=gv', true)
bind_v('K', ':m .-2<cr>gv=gv', true)
-- single line movement in 2 modes
bind_i('<C-j>', ':m .+1<cr>==', true)
bind_i('<C-k>', ':m .-2<cr>==', true)
bind_n('<C-S-j>', ':m .+1<cr>==', true)
bind_n('<C-S-k>', ':m .-2<cr>==', true)

-- Plugin: Hop bindings
bind_n('<leader>j', "<cmd>lua require'hop'.hint_words()<cr>")
bind_n('q', '%')

-- improve identation
bind_v('>', '>gv')
bind_v('<', '<gv')

-- No Highlight
bind_n('<leader>hc', '<cmd>nohls<cr>', {silent=true})

-- buffer and tab movement (replaced with barbar)
-- bind_n('<tab>', '<cmd>tabnext<cr>', true)
-- bind_n('<s-tab>', '<cmd>tabprev<cr>', true)
-- bind_n('<C-]>', '<cmd>tabnext<cr>', true)
-- bind_n('<C-[>', '<cmd>tabprev<cr>', true)

-- " No recording, its not AVG PROOFFF!
bind_n('Q', '<nop>', true)
bind_n('q', '<nop>', true)
bind_n('qq', '<nop>', true)

-- " change escape key to jj
bind_i('<C-c>', '<esc>')
bind_i('jk', '<esc>', true)
bind_i('kj', '<esc>', true)

-- Keeping it centered
bind_n('n', 'nzzzv', true)
bind_n('N', 'Nzzzv', true)
bind_n('J', 'mzJ`z', true)

-- Undo break points for undo
bind_i(',', ',<c-g>u', true)
bind_i('.', '.<c-g>u', true)
bind_i('!', '!<c-g>u', true)
bind_i('?', '?<c-g>u', true)

-- Improve DD not to yank
--bind_n('dd', '"_dd', true)
--bind_n('D', '"_D', true)

-- Easier Copy pasta
bind_n('Y', 'y$', {noremap=true, silent=true})

key_bind('', '<leader>y', '"*y')
key_bind('', '<leader>Y', '"+y')
key_bind('', '<leader>p', '"*p')
key_bind('', '<leader>P', '"+p')

-- Delete line without copy selection
bind_n('<leader>d', '"_d')
key_bind('x', '<leader>d', '"_d')
key_bind('x', '<leader>p', '"_dP')

--[[ noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p ]]

-- Prettier formatter
bind_n('<C-S-p>', '<cmd>Prettier', true)
bind_n('<C-S-ENTER>', '<cmd>Prettier', true)

-- REFERENCES
-- Helpers for setup proper keybindings:
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/plugin/lsp.vim
-- https://github.com/nanotee/nvim-lua-guide#defining-mappingsv
