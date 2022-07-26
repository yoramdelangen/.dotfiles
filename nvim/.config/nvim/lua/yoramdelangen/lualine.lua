require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    component_separators = '',
    -- section_separators = { left = '', right = ''},
    section_separators = '',
  --   disabled_filetypes = {
  --     statusline = {},
  --     winbar = {},
  --   },
  --   globalstatus = false,
    refresh = {
      statusline = 500,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'diff', '%=', {'filename', path=3 }},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'%=', {'filename', path=3 }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  -- tabline = {},
  -- winbar = {},
  -- inactive_winbar = {},
  -- extensions = {}
}
