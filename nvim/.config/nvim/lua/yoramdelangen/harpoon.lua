require "harpoon".setup()


local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>lua require("harpoon.mark").add_file()<cr>', options)

vim.api.nvim_set_keymap('n', '<A-1>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-2>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-3>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-4>', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-5>', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-6>', '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-7>', '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-8>', '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', options)
vim.api.nvim_set_keymap('n', '<A-9>', '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', options)
