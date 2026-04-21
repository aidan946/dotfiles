vim.pack.add { 'https://github.com/obsidian-nvim/obsidian.nvim' }

require('obsidian').setup {
  ui = { enable = false },
  sync = {
    enabled = false,
  },
  legacy_commands = false,
  workspaces = {
    {
      name = 'personal',
      path = '~/obsidian/personal',
    },
  },
}
