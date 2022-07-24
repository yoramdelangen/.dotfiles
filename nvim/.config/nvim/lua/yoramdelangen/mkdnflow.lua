require 'mkdnflow'.setup({
  to_do = {
    symbols = {' ', 'x'},
    update_parents = true,
    not_started = ' ',
    in_progress = '-',
    complete = 'x'
  },

  mappings = {
    MkdnToggleToDo = {{'n', 'v'}, '<leader>x'},
  }
})

-- TODO: https://github.com/ekickx/clipboard-image.nvim
