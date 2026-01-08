return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    event = 'VeryLazy',
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = 'personal',
          path = '$HOME/obsidian/personal/',
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      },
      new_notes_location = 'current_dir',
      ui = {
        enable = false,
      },
      daily_notes = {
        folder = 'Daily',
        date_format = '%Y-%m-%d',
        alias_format = '%B %-d, %Y',
        template = nil,
      },
      templates = {
        subdir = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        substitutions = {},
      },
      picker = {
        name = 'snacks.pick',
      },
      footer = {
        enabled = false,
      },
    },
  },
}
