vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }
require('diffview').setup {}

vim.keymap.set('n', '<leader>do', '<Cmd>DiffviewOpen<cr>', { desc = 'Open diffview' })
vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<cr>', { desc = 'Close diffview' })
