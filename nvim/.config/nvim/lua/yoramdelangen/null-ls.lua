local builtins = require 'null-ls'.builtins

require('null-ls').setup {
  debug = true,
  sources = {
    -- FORMATTERS
    builtins.formatting.stylua,
    builtins.formatting.shfmt,
    builtins.formatting.prettier.with({
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.prettierrc",
      }
    }),
    builtins.formatting.phpcsfixer.with({
      extra_args =  function (params)
        vim.inspect(params)
        params.config = vim.fn.expand '~/.php-cs-fixer.dist.php'
      end
    }),

    -- DIAGNOSTICS
    builtins.diagnostics.eslint,

    -- CODE ACTIONS
    builtins.code_actions.gitsigns,
    -- builtins.completion.spell,
  },
}

