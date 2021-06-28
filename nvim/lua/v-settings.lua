--[[
O is the global options object
Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

O = {}
-- general
O.auto_close_tree = 1
O.wrap_lines = false
O.timeoutlen = 100

O.treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
} 
