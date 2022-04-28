require "harpoon".setup()

local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require("harpoon.mark").add_file()<cr>', options)

vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>6', '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>7', '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>9', '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', options)
