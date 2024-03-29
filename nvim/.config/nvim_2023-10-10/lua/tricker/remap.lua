-- Keynotation: https://neovim.io/doc/user/intro.html#key-notation

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix list
vim.keymap.set("n", "<C-[>", "<cmd>cprev<cr>", { noremap = true })
vim.keymap.set("n", "<C-]>", "<cmd>cnext<cr>", { noremap = true })
vim.keymap.set("n", "<leader>q", "<cmd>cclose<cr>", { noremap = true })

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ff", function()
	vim.lsp.buf.format({ async = true })
	print("Formatted buffer")
end, { desc = "Formatting the current buffer" })

-- Custom keymap to reload Neovim
vim.keymap.set("n", "<leader>r", "<cmd>Reload<cr>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Easy replace something" }
)

-- simple window management
vim.keymap.set("n", "<C-Bslash>", "<cmd>vsplit<cr> <C-w>l")
-- vim.keymap.set("n", "<S-->", "<cmd>split<cr>")
