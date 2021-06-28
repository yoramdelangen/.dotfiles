--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2

vim.cmd[[colorscheme onedark]]
vim.o.guifont = "DejaVuSansMono Nerd Font:h12"

-- Statusbar
--Set statusbar
vim.g.lightline = { colorscheme = 'onedark';
      active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
--       component_function = { gitbranch = 'fugitive#head', };
}
