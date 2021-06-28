-- Helping to easily dump something, same input as vim.inspect
-- https://github.com/nanotee/nvim-lua-guide#the-vim-namespace
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

-- Lazy and quickly bind keys
function key_bind(mode, combo, cmd, opts)
  opts = opts or {}
  vim.api.nvim_set_keymap(mode, combo, cmd, opts)
end

