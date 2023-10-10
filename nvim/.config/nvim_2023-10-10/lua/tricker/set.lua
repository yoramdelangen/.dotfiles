vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.o.background = nil

vim.opt.nu = true
vim.opt.relativenumber = true

-----------------------------------------------------------
-- SET THE BEHAVIOR OF TAB
-----------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-----------------------------------------------------------
-- SEARCH OPTIONS
-----------------------------------------------------------
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmatch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-----------------------------------------------------------
-- Commands
-----------------------------------------------------------
local command = vim.api.nvim_create_user_command
command("WQ", "wq", {})
command("Wq", "wq", {})
command("W", "w", {})
command("Q", "q", {})

command("Format", function() vim.lsp.buf.format { async = true } end, {})
command("Reload", function()
  vim.cmd([[
    update $MYVIMRC
    source $MYVIMRC
	]])

  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {})
