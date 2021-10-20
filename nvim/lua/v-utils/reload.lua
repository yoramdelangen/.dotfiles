local C = {}
function C.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:find('^v-') then
      print(name)
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

key_bind('n', '<Leader>vs', '<Cmd>lua require "v-utils/reload".ReloadConfig()<CR>', { silent = true, noremap = true })
vim.cmd('command! ReloadConfig lua require "v-utils/reload".ReloadConfig()')

return C
