require 'mkdnflow'.setup({
  to_do = {
    symbols = {' ', '-', 'X'},
    update_parents = true,
    not_started = ' ',
    in_progress = '-',
    complete = 'X'
  },

  mappings = {
    MkdnToggleToDo = {{'n', 'v'}, '<leader>x'},
  }
})

-- TODO: https://github.com/ekickx/clipboard-image.nvim
