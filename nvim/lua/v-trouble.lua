require("trouble").setup { -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local opt = {silent = true, noremap = true}

key_bind("n", "<leader>xx", "<cmd>Trouble<cr>", opt)
key_bind("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opt)
key_bind("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opt)
key_bind("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opt)
key_bind("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opt)
key_bind("n", "gR", "<cmd>Trouble lsp_references<cr>", opt)
