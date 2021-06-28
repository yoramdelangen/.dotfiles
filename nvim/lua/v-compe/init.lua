-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

 source = {
    path = {kind = "   (Path)"},
    buffer = {kind = "   (Buffer)"},
    calc = {kind = "   (Calc)"},
    vsnip = {kind = "   (Snippet)"},
    nvim_lsp = {kind = "   (LSP)"},
    -- nvim_lua = {kind = "  "},
    nvim_lua = false,
    spell = {kind = "   (Spell)"},
    tags = false,
    vim_dadbod_completion = true,
    -- snippets_nvim = {kind = "  "},
    -- ultisnips = {kind = "  "},
    -- treesitter = {kind = "  "},
    emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
    -- for emoji press : (idk if that in compe tho)
  } 
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

key_bind('i', '<C-Space>', 'compe#complete()', {silent=true, expr=true})
key_bind('i', '<CR>', 'compe#confirm("<CR>")', {silent=true, expr=true})
key_bind('i', '<C-e><C-e>', 'compe#close("<C-e><C-e>")', {silent=true, expr=true})
key_bind('i', '<C-f>', 'compe#scroll({ "delta": +4 })', {silent=true, expr=true})
key_bind('i', '<C-d>', 'compe#scroll({ "delta": -4 })', {silent=true, expr=true})

key_bind("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
key_bind("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
key_bind("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
key_bind("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

