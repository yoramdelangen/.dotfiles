vim.cmd('filetype plugin on')

-- GLOBAL OPTIONS
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true -- Show title??
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0 -- So that I can see `` in markdown files

-- spacing
vim.o.smarttab = true -- Smart tabbing?
vim.o.breakindent = true -- ident -> same amount of space as the beginning of that line

-- VIM script options
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces

-- GLOBAL WINDOW OPTIONS
vim.wo.cursorline = true
vim.wo.number = true

-- GLOBAL BUFFER OPTIONS
vim.bo.smartindent = true




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
