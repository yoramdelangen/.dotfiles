local builtin = require("telescope.builtin")

-- search for files
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Project GIT Files" })
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })

vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show open buffers" })
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "Show document symbols" })
vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols, { desc = "Show workspace symbols" })

-- some file/term searching
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Do some live grep" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search in project" })

-- symbols
vim.keymap.set("n", "<leader>d", builtin.lsp_references, { desc = "find reference(s)" })

