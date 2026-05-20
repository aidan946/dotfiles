vim.pack.add { 'https://github.com/dmtrKovalenko/fff.nvim' }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd 'fff.nvim'
      end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  title = 'Files',
  lazy_sync = true,
  layout = {
    prompt_position = 'top',
  },
}

vim.keymap.set('n', 'sf', function() end, { desc = 'FFFind files' })

vim.keymap.set('n', '<leader>sf', function()
  require('fff').find_files()
end, { desc = 'Search Files' })
vim.keymap.set({ 'n' }, '<leader>sw', function()
  require('fff').live_grep { query = vim.fn.expand '<cword>' }
end, { desc = 'Search Current Word' })
vim.keymap.set({ 'n' }, '<leader>sg', function()
  require('fff').live_grep()
end, { desc = 'Search by Grep' })
