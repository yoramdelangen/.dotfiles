local O = vim.o
local g = vim.g
local opt = vim.opt
local wo = vim.wo

-----------------------------------------------------------
-- GLOBAL OPTIONS
-----------------------------------------------------------
opt.mouse = 'a'
O.shortmess = O.shortmess .. 'c'
g.noswapfile = true

-----------------------------------------------------------
-- SET THE BEHAVIOR OF TAB
-----------------------------------------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.scrolloff = 8
opt.smartindent = true
opt.iskeyword:append('-')

-----------------------------------------------------------
-- Toggle invisible characters
-----------------------------------------------------------
opt.list = true
opt.listchars = {
  tab = "→ ",
  eol = "¬",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

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
wo.showbreak = '↪'

-----------------------------------------------------------
-- THEMING
-----------------------------------------------------------
opt.termguicolors = true
O.background = 'dark' -- or "light" for light mode
g.gruvbox_contrast_dark = 'hard'
vim.cmd([[ colorscheme gruvbox ]])

-----------------------------------------------------------
-- LOADING OTHER CONFIG
-----------------------------------------------------------
require 'yoramdelangen.startup'
require 'yoramdelangen.keymappings'
require 'yoramdelangen.packer'

require 'yoramdelangen.treesitter'
require 'yoramdelangen.telescope'
require 'yoramdelangen.lsp'
require 'yoramdelangen.cmp'
require 'yoramdelangen.gitsigns'
require 'yoramdelangen.toggleterm'
require 'yoramdelangen.nvim-tree'
require 'yoramdelangen.kommentary'
require 'yoramdelangen.null-ls'
require 'yoramdelangen.bufdel'
require 'yoramdelangen.harpoon'
-- require 'yoramdelangen.mkdnflow'
