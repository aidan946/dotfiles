vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }

require('bufferline').setup {
  options = {
    close_command = function(n)
      Snacks.bufdelete(n)
    end,
    right_mouse_command = function(n)
      Snacks.bufdelete(n)
    end,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = false,
  },
}

vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
  callback = function()
    vim.schedule(function()
      pcall(nvim_bufferline)
    end)
  end,
})

vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle Pin' })
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Delete Non-Pinned Buffers' })
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Delete Buffers to the Right' })
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Delete Buffers to the Left' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[B', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer prev' })
vim.keymap.set('n', ']B', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer next' })
