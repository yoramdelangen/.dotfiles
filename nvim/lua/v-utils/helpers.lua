-- Helping to easily dump something, same input as vim.inspect
-- https://github.com/nanotee/nvim-lua-guide#the-vim-namespace
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

local function merge(t1, t2)
  for k,v in pairs(t2) do t1[k] = v end
end

-- Lazy and quickly bind keys
function key_bind(mode, combo, cmd, opts)
  if (type(opts) == "boolean" and opts == true ) then
    opts = { noremap = true }
  end

  opts = opts or {}
  vim.api.nvim_set_keymap(mode, combo, cmd, opts)
end

-- be more lazy
function bind_i(combo, cmd, opts)
  key_bind('i', combo, cmd, opts)
end
function bind_n(combo, cmd, opts)
  key_bind('n', combo, cmd, opts)
end
function bind_v(combo, cmd, opts)
  key_bind('v', combo, cmd, opts)
end


-- helper function for fixing highlighting
local function highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
	local parts = {group}
	if guifg then table.insert(parts, "guifg=#"..guifg) end
	if guibg then table.insert(parts, "guibg=#"..guibg) end
	if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
	if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
	if attr then
		table.insert(parts, "gui="..attr)
		table.insert(parts, "cterm="..attr)
	end
	if guisp then table.insert(parts, "guisp=#"..guisp) end

	-- nvim.ex.highlight(parts)
	vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end
