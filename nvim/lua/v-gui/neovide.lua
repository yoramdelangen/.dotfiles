vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_fullscreen = false 
vim.g.neovide_no_idle=true

key_bind('n', '<D-v>', '"+p', {silent=true})
key_bind('n', '<D-c>', '"+y', {silent=true})
key_bind('i', '<D-v>', '<ESC>"+p', {silent=true})
key_bind('i', '<D-c>', '<ESC>"+y', {silent=true})

key_bind('n', '<leader><S-f>', "<cmd>lua require'v-gui/neovide'.toggleFullscreen()<cr>")

M = {}
function M.toggleFullscreen()
  -- vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen 
  vim.cmd('let g:neovide_fullscreen=! g:neovide_fullscreen')
  print('toggle fullscreen to '.. tostring(vim.g.neovide_fullscreen))
end
return M

