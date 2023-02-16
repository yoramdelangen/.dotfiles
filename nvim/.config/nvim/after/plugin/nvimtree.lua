vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFindFileToggle<cr>")

-- empty setup using defaults
require("nvim-tree").setup()
