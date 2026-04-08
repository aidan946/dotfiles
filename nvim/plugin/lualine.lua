vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
local lualine_require = require 'lualine_require'
lualine_require.require = require

vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
  vim.o.statusline = ' '
else
  vim.o.laststatus = 0
end

require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    theme = 'auto',
    globalstatus = vim.o.laststatus == 3,
    disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter' } },
  },
  extensions = { 'lazy' },
}
