vim.cmd('filetype plugin on')

-- Custom filetypes
vim.cmd 'autocmd BufRead,BufNewFile *.blade.php set filetype=blade'
-- GLOBAL OPTIONS

vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true -- Show title??
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.numberwidth = 5 -- Set gutter width
vim.o.ignorecase = true -- set search cases to in-sensitive

-- spacing
vim.o.smarttab = true -- Smart tabbing?
vim.o.autoindent = true
vim.o.breakindent = true -- ident -> same amount of space as the beginning of that line

-- script options
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation

-- GLOBAL WINDOW OPTIONS
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.scrolloff = 10

-- Speed up completion windows
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 300 -- By default timeoutlen is 1000 ms

-- disable certain default plugins
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_matchit      = 1
vim.g.loaded_matchparen   = 1
vim.g.loaded_spec         = 1

-- GLOBAL BUFFER OPTIONS
-- vim.bo.smartindent = true

-- OTHER GLOBAL STUFF
--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

-- Cause im to quick to handle
vim.cmd([[command! WQ wq]])
vim.cmd([[command! Wq wq]])
vim.cmd([[command! W w]])
vim.cmd([[command! Q q]])
