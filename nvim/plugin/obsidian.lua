vim.pack.add { 'https://github.com/obsidian-nvim/obsidian.nvim', 'https://github.com/folke/snacks.nvim' }

require('obsidian').setup {
  legacy_commands = false,
  workspaces = {
    {
      name = 'personal',
      path = '$HOME/obsidian/personal/',
    },
  },
  ui = {
    enable = false,
  },
}
