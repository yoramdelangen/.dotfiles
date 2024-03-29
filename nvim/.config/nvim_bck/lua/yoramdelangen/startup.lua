-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- disable nvim intro
vim.opt.shortmess:append "sI"

-- very nice copied from: https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/settings.lua
