local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

augroup("TrimGroup", { clear = true })
autocmd("BufWritePre", {
  group = "TrimGroup",
  pattern = "*",
  callback = function(buf)
    if string.match(buf.file, "*.[md|wiki]") then
      return
    end

    vim.cmd([[ %s/\s\+$//e ]])
  end,
})

augroup("SetFileTypes", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  group = "SetFileTypes",
  pattern = "*",
  callback = function(buf)
    local regx = "%/%.env*"

    if not string.match(buf.match, regx) then
      return
    end

    vim.cmd([[ setfiletype bash ]])
  end,
})
