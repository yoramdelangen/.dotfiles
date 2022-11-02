local lsp = require("lspconfig")
local on_attach = require("yoramdelangen.lsp.on_attach")
local tsserver_path = vim.fn.expand("~/.config/yarn/global/node_modules/typescript/lib/tsserverlibrary.js")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local function lsp_conf(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach;
		flags = {
			-- This is the default in Nvim 0.7+
			debounce_text_changes = 150,
		},
	}, _config or {})
end

lsp.tsserver.setup(lsp_conf()) -- JS/Typescript
lsp.intelephense.setup(lsp_conf()) -- PHP
lsp.html.setup(lsp_conf())
lsp.tailwindcss.setup(lsp_conf())
lsp.cssls.setup(lsp_conf())
lsp.volar.setup(lsp_conf({
	init_options = {
		typescript = {
			serverPath = tsserver_path,
		},
	},
})) -- Vue3
lsp.gopls.setup(lsp_conf()) -- GO lang
lsp.pyright.setup(lsp_conf())
lsp.rust_analyzer.setup(lsp_conf({
	settings = {
		["rust-analyzer"] = {},
	},
})) -- Server-specific settings...

------------------------------------------------
-- Adding more languages here
------------------------------------------------

-- LUA
-- TODO: fix this static path to be dynamic....
local sumneko_root_path = vim.fn.expand("~/workspace/builds/lua-language-server")
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup(lsp_conf({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/bin/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}))

-- REFERENCES
-- https://elianiva.my.id/post/my-nvim-lsp-setup
