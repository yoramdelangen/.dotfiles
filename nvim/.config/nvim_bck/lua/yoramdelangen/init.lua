local O = vim.o
local g = vim.g
local opt = vim.opt
local wo = vim.wo

local command = vim.api.nvim_create_user_command

-----------------------------------------------------------
-- GLOBAL OPTIONS
-----------------------------------------------------------
opt.mouse = "a"
opt.swapfile = false
O.shortmess = O.shortmess .. "c"
g.noswapfile = true
vim.opt.clipboard = "unnamedplus"

-----------------------------------------------------------
-- SET THE BEHAVIOR OF TAB
-----------------------------------------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.scrolloff = 8
opt.smartindent = true
opt.iskeyword:append("-")
opt.iskeyword:append("_")
opt.cmdheight = 0

-----------------------------------------------------------
-- Toggle invisible characters
-----------------------------------------------------------
opt.list = true
opt.listchars = {
	tab = "→ ",
	eol = "¬",
	trail = "⋅",
	extends = "❯",
	precedes = "❮",
}

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-----------------------------------------------------------
-- SEARCH OPTIONS
-----------------------------------------------------------
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true

-----------------------------------------------------------
-- GLOBAL WINDOW OPTIONS
-----------------------------------------------------------
wo.cursorline = true
wo.number = true
wo.showbreak = "↪"
wo.relativenumber = true

-----------------------------------------------------------
-- NETWR
-----------------------------------------------------------
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-----------------------------------------------------------
-- THEMING
-----------------------------------------------------------
opt.termguicolors = true
O.background = "dark" -- or "light" for light mode
-- g.gruvbox_contrast_dark = 'hard'
-- vim.cmd([[ colorscheme gruvbox ]])
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])

-----------------------------------------------------------
-- Commands
-----------------------------------------------------------
command("WQ", "wq", {})
command("Wq", "wq", {})
command("W", "w", {})
command("Q", "q", {})
command("Format", function()
	vim.lsp.buf.format({ timeout = 4000 })
end, {})
command("Reload", function()
	vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])

	vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {})

-----------------------------------------------------------
-- Abbreviations
-----------------------------------------------------------
vim.cmd("abbr funciton function")
vim.cmd("abbr teh the")
vim.cmd("abbr tempalte template")
vim.cmd("abbr fitler filter")
vim.cmd("abbr cosnt const")
vim.cmd("abbr attribtue attribute")
vim.cmd("abbr attribuet attribute")

-----------------------------------------------------------
-- LOADING OTHER CONFIG
-----------------------------------------------------------
require("yoramdelangen.startup")
require("yoramdelangen.autocmds")
require("yoramdelangen.keymappings")
require("yoramdelangen.packer")
require("yoramdelangen.treesitter")
require("yoramdelangen.telescope")
require("yoramdelangen.lsp-zero")
-- require("yoramdelangen.lsp")
require("yoramdelangen.tabnine")
require("yoramdelangen.cmp")
require("yoramdelangen.gitsigns")
-- require 'yoramdelangen.nvim-tree'
require("yoramdelangen.kommentary")
require("yoramdelangen.null-ls")
require("yoramdelangen.bufdel")
require("yoramdelangen.harpoon")
require("yoramdelangen.mkdnflow")
require("yoramdelangen.lualine")
-- require 'yoramdelangen.todo-comments'
