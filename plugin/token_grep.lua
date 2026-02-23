if vim.fn.exists(':TokenGrep') ~= 0 then
  return
end

vim.api.nvim_create_user_command('TokenGrep', function(opts)
  require('token_grep').search(opts)
end, { 
  nargs = "?", 
  desc = "Search for token in directory tree (respects .gitignore)" 
})
