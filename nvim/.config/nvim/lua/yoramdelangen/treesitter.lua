require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'lua', 'javascript', 'typescript', 'php', 'vue' },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      css = '// %s'
    }
  },
  autotag = {
    enable = true
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
}

require 'nvim-ts-autotag'.setup {}
