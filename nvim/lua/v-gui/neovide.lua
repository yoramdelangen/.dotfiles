vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_fullscreen = false
vim.g.neovide_no_idle=true

local opt = { silent=true }

key_bind('', '<D-v>', '"+p', opt)
key_bind('', '<D-c>', '"+y', opt)
--[[ key_bind('', '<D-v>', '<ESC>"+p', opt)
key_bind('', '<D-c>', '<ESC>"+y', opt) ]]

key_bind('', '<C-a>\\', '<cmd>vsplit<cr>', opt)
key_bind('', '<C-a>-', '<cmd>split<cr>', opt)

key_bind('n', '<leader>F', "<cmd>lua require'v-gui/neovide'.toggleFullscreen()<cr>")

M = {}
function M.toggleFullscreen()
  -- vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  vim.cmd('let g:neovide_fullscreen=! g:neovide_fullscreen')
  print('toggle fullscreen to '.. tostring(vim.g.neovide_fullscreen))
end
return M

