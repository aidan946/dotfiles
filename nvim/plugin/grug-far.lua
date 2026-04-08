vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }
require('grug-far').setup { headerMaxWidth = 80 }

vim.api.nvim_create_user_command('GrugFar', function()
  local grug = require 'grug-far'
  local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
  grug.open {
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
    },
  }
end, {})

vim.keymap.set({ 'n', 'v' }, '<leader>sr', function()
  local grug = require 'grug-far'
  local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
  grug.open {
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
    },
  }
end, { desc = 'Search and Replace' })
