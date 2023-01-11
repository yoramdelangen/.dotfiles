local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'eslint',
  'sumneko_lua',
  'intelephense',
  'volar',
  'gopls',
  'yamlls',
  'rust_analyzer',
  'tailwindcss',
  'vls'
})

lsp.nvim_workspace()
lsp.setup()

vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = true,
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('x', '<space>ca', vim.lsp.buf.range_code_action, opts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, opts)
vim.keymap.set('x', '<space>f', vim.lsp.buf.range_formatting, opts)
vim.keymap.set('n', 'C-k', vim.lsp.buf.signature_help, opts)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
-- map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
-- map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
