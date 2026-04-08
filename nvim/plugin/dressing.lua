vim.pack.add { 'https://github.com/stevearc/dressing.nvim' }

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(...)
  vim.cmd.packadd 'dressing.nvim'
  return vim.ui.select(...)
end
