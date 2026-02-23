local M = {}

M.search = function(opts)
  local token = opts.args
  if token == "" or token == nil then
    token = vim.fn.expand("<cword>")
  end

  if token == "" then
    vim.notify("No token provided and cursor is not on a word.", vim.log.levels.WARN)
    return
  end

  local cmd = string.format("rg --vimgrep --smart-case -- %s", vim.fn.shellescape(token))
  local lines = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 and #lines == 0 then
    vim.notify("No matches found for: " .. token, vim.log.levels.INFO)
    return
  end

  vim.fn.setqflist({}, ' ', {
    title = 'TokenGrep: ' .. token,
    lines = lines,
  })

  vim.cmd("copen")
  vim.notify("Found " .. #lines .. " instances of '" .. token .. "'", vim.log.levels.INFO)
end

return M
