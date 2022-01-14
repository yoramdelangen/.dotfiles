require 'bufdel'.setup {
  next = 'alternate',  -- or 'cycle' | What to do after closing a buffer
  quit = false, -- Close neovim after closing last buffer
}
