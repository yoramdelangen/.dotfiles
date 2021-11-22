local custom = require'lualine.themes.ayu_mirage'

-- custom.color2 = require'lualine.utils.utils'.extract_highlight_colors('Normal', 'bg')
local bg_color = require'lualine.utils.utils'.extract_highlight_colors('Normal', 'bg')

custom.normal.c.bg = bg_color
custom.normal.b.bg = bg_color
custom.normal.c.fg = '#b2b5b8'
custom.inactive.c.bg = bg_color
custom.inactive.b.bg = bg_color
custom.inactive.c.fg = '#b2b5b8'

require('lualine').setup({
  options = {
    theme = custom,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' }
  }
})
