require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'php', 'python', 'yaml', 'vue', 'vim', 'scss', 'php', 'rust', 'tsx', 'javascript', 'fish', 'dockerfile', 'go', 'bash', 'css', 'html', 'json', 'json5', 'hjson', 'jsdoc', 'lua', 'nix', 'typescript' },
    ignore_install = {},
    matchup = {
      enable = true
    },
    highlight = {
      enable = true
    },
    playground = {
      enable = true
    },
    context_commentstring = {
      enable = true,
      config = {
        css = '// %s'
      }
    },
    autotag = { 
      enable = true
    },
}

require 'nvim-ts-autotag'.setup()
