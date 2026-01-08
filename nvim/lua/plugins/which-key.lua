return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'helix',

      spec = {
        mode = { 'n', 'v' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>g', group = 'Git' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>x', group = 'Quickfix', icon = { icon = '󱖫 ', color = 'green' } },
        { '<leader>t', group = 'Toggle' },
        { '<leader>u', group = 'Ui', icon = { icon = '󰙵 ', color = 'cyan' } },
        { '<leader>h', group = 'Git [H]unk' },
      },
    },
  },
}
