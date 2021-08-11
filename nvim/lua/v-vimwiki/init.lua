-- CONFIG
vim.g.vimwiki_list = {
    {
        path = '~/.vimwiki/',
        syntax = 'markdown',
        ext = '.wiki'
    }
}

--KEYMAPPINGS
key_bind('n', '<leader>w?', '<cmd>h vimwiki-mappings<cr>', {noremap=true})
key_bind('n', '<leader>ww', '<cmd>lua require"v-vimwiki".startupVimwiki()<cr>', {noremap=true})

-- ALLOW FOR CONTROLL
M = {}
function M.startupVimwiki()
  -- Set working directory to vimwiki folder.
  vim.cmd([[ lcd $HOME/.vimwiki ]]) -- set working directory to open file/folder

  -- Startup VimWiki
  vim.cmd([[ VimwikiIndex ]])

  -- Make sure we see were loaded our Vimwiki
  print('🔥 Our wikipowers are here..')
end
return M
