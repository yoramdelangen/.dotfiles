local luasnip = require("luasnip")

-- Register custom commands
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
vim.api.nvim_exec([[
augroup AutoFormatting
  autocmd!
  let blacklist = ['md', 'markdown', 'vimwiki']
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e
  autocmd BufWritePre *.ts,*.tsx,*.js,*.vue Format
  autocmd BufWritePre *.lua Format
augroup end
]], false)

-- KEYBINDINGS

local opts = { noremap=true, silent=true }
key_bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
key_bind('n', '<leader>vs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
key_bind('n', '<leader>vh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
key_bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
key_bind('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
key_bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
-- key_bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts) -- will be replaced by Telescope

-- Helper functions
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp.
-- Mapping: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local cmp = require'cmp'
cmp.setup({
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length=5 },
    },
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)
        end,
    },
    experimental = {
      ghost_text = true
    }
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

-- Config: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lsp = require 'lspconfig'
local tsserver_path = os.getenv("HOME") .. '/.config/yarn/global/node_modules/typescript/lib/tsserverlibrary.js'

-- START ALL LSP SERVERS
lsp.tsserver.setup(config()) -- JS/Typescript
lsp.intelephense.setup(config()) -- PHP
lsp.html.setup(config())
lsp.tailwindcss.setup(config())
lsp.cssls.setup(config())
lsp.bashls.setup(config())
lsp.jedi_language_server.setup(config()) -- Python
lsp.gopls.setup(config({
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))
-- lsp.vuels.setup(config())
lsp.volar.setup(config({
  init_options = {
      typescript = {
          serverPath = tsserver_path
      }
  }
}))

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/Users/yoram/Workspace/Builds/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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
}

--[[ local on_attach = function(_client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function setup_servers()
  LspInstall.setup()
  local servers = { 'html', 'vue', 'php', 'css', 'python', 'bash', 'go', 'json', 'typescript' }

  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{ on_attach=on_attach }
  end
end

setup_servers() ]]

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--[[ LspInstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
 ]]
-- require('v-lsp/lua')

-- Map :Format to vim.lsp.buf.formatting()

-- https://github.com/neovim/nvim-lspconfig/wiki/Complete-init.lua-example
