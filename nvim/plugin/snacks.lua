vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  git = { enabled = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  quickfile = { enabled = true },
  picker = { endabled = true },
  scratch = { enabled = false },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
  toggle = { enabled = false },
  words = { enabled = true },
}

vim.keymap.set({ 'n' }, '<leader>z', function()
  Snacks.zen()
end, { desc = 'Toggle Zen Mode' })
vim.keymap.set({ 'n' }, '<leader>.', function()
  Snacks.scratch()
end, { desc = 'Toggle Scratch Buffer' })
vim.keymap.set({ 'n' }, '<leader>S', function()
  Snacks.scratch.select()
end, { desc = 'Select Scratch Buffer' })
vim.keymap.set({ 'n' }, '<leader>n', function()
  Snacks.notifier.show_history()
end, { desc = 'Notification History' })
vim.keymap.set({ 'n' }, '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
vim.keymap.set({ 'n' }, '<leader>cR', function()
  Snacks.rename.rename_file()
end, { desc = 'Rename File' })
vim.keymap.set({ 'n' }, '<leader>gb', function()
  Snacks.git.blame_line()
end, { desc = 'Git Blame Line' })
vim.keymap.set({ 'n' }, '<leader>gf', function()
  Snacks.lazygit.log_file()
end, { desc = 'Lazygit Current File History' })
vim.keymap.set({ 'n' }, '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })
vim.keymap.set({ 'n' }, '<leader>gl', function()
  Snacks.lazygit.log()
end, { desc = 'Lazygit Log (cwd)' })
vim.keymap.set({ 'n' }, '<leader>un', function()
  Snacks.notifier.hide()
end, { desc = 'Dismiss All Notifications' })
vim.keymap.set({ 'n', 't' }, '<c-_>', function()
  Snacks.terminal()
end, { desc = 'Toggle Terminal' })
vim.keymap.set({ 'n', 't' }, ']]', function()
  Snacks.words.jump(vim.v.count1)
end, { desc = 'Next Reference' })
vim.keymap.set({ 'n', 't' }, '[[', function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = 'Prev Reference' })
vim.keymap.set({ 'n' }, '<leader>sh', function()
  Snacks.picker.help()
end, { desc = 'Search Help' })
vim.keymap.set({ 'n' }, '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = 'Search Keymaps' })
vim.keymap.set({ 'n' }, '<leader>sf', function()
  Snacks.picker.files()
end, { desc = 'Search Files' })
vim.keymap.set({ 'n' }, '<leader>sw', function()
  Snacks.picker.grep_word()
end, { desc = 'Search Current Word' })
vim.keymap.set({ 'n' }, '<leader>sg', function()
  Snacks.picker.grep()
end, { desc = 'Search by Grep' })
vim.keymap.set({ 'n' }, '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = 'Search Document Diagnostics' })
vim.keymap.set({ 'n' }, '<leader>sb', function()
  Snacks.picker.buffers()
end, { desc = 'Search Buffers' })

vim.schedule(function()
  Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
  Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
  Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
  Snacks.toggle.diagnostics():map '<leader>ud'
  Snacks.toggle.line_number():map '<leader>ul'
  Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
  Snacks.toggle.treesitter():map '<leader>uT'
  Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
  Snacks.toggle.inlay_hints():map '<leader>uh'
  Snacks.toggle.indent():map '<leader>ug'
  Snacks.toggle.dim():map '<leader>uD'
end)
