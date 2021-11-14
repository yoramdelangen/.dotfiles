-- Settings
vim.g.bufferline = {
  closable = false,
  maximum_padding = 1,
  -- netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted'
}

local opts = {noremap=true,silent=true}
-- Bindings
key_bind('n', '<A-[>', '<cmd>BufferPrevious<CR>', opts)
key_bind('n', '<A-]>', '<cmd>BufferNext<CR>', opts)
key_bind('n', '<A-q>', '<cmd>BufferClose<CR>', opts)

for i=1,10 do
  key_bind('n', '<A-'..i..'>', '<cmd>BufferGoto '..i..'<cr>', opts)
end
