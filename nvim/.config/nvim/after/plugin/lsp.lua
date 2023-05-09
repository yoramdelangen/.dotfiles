local lsp = require("lsp-zero")
local mason = require("mason")
local null_ls = require("null-ls")

mason.setup({
	ui = {
		border = "rounded",
	},
})

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
	"gopls",
	"intelephense",
	"volar",
})

lsp.set_preferences({
	virtual_text = true,
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- Server specific configuration
lsp.configure("prettier", {
	env = {
		PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.prettierrc"),
	},
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

lsp.on_attach(function(client, bufnr)
	local opts = {
		remap = false,
		silent = true,
		buffer = bufnr,
	}

	local map = function(m, lhs, rhs)
		vim.keymap.set(m, lhs, rhs, opts)
	end

	-- Disable LSP server formatting, to prevent formatting twice.
	-- Once by the LSP server, second time by NULL-ls.
	if client.name == "volar" or client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end

	vim.keymap.set({ "n", "x" }, "<leader>f", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end)

	-- LSP actions
	map("n", "K", vim.lsp.buf.hover)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "go", vim.lsp.buf.type_definition)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "<C-k>", vim.lsp.buf.signature_help)
	map("n", "<leader>rn", vim.lsp.buf.rename)
	map("n", "<leader>ws", vim.lsp.buf.workspace_symbol)
	map("n", "<leader>ca", vim.lsp.buf.code_action)
	map("x", "<leader>ca", vim.lsp.buf.range_code_action)

	-- Diagnostics
	map("n", "gl", vim.diagnostic.open_float)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
end)

-- lsp.nvim_workspace()
lsp.setup()

-- -- setup MasonNullLs for null-ls usage with Mason
require("mason-null-ls").setup({
  automatic_installation = false,
  -- automatic_setup = false,
  handlers = {},
})
null_ls.setup()
--
-- print("Setup LSP completed")
