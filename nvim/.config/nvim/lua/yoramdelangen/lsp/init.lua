local lsp = require 'lspconfig'
local on_attach = require 'yoramdelangen.lsp.on_attach'
local cmp_lsp = require 'cmp_nvim_lsp'

local tsserver_path = vim.fn.expand '~/.config/yarn/global/node_modules/typescript/lib/tsserverlibrary.js'

local function lsp_conf(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = on_attach;
        capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities());
        root_dir = function() return vim.loop.cwd() end
    }, _config or {})
end

------------------------------------------------
-- Adding more languages here
------------------------------------------------
lsp.tsserver.setup(lsp_conf()) -- JS/Typescript
lsp.intelephense.setup(lsp_conf()) -- PHP
lsp.html.setup(lsp_conf())
lsp.tailwindcss.setup(lsp_conf())
lsp.cssls.setup(lsp_conf())
lsp.volar.setup(lsp_conf({
  init_options = {
      typescript = {
          serverPath = tsserver_path
      }
  }
})) -- Vue3
lsp.gopls.setup(lsp_conf()) -- GO lang

-- LUA
-- TODO: fix this static path to be dynamic....
local sumneko_root_path = '/Users/yoram/Workspace/Builds/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup(lsp_conf({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
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
