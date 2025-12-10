return {
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      {
        'saghen/blink.compat',
        version = '*',
      },
      { 'fang2hou/blink-copilot' },
      {
        'echasnovski/mini.snippets',
        lazy = true,
        version = false,
        opts = function()
          local gen_loader = require('mini.snippets').gen_loader
          return {
            snippets = {
              gen_loader.from_file(vim.fn.expand '~/.config/nvim/snippets/global.json'),
              gen_loader.from_lang(),
            },
          }
        end,
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            async = true,
          },
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'mini_snippets' },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      signature = { enabled = true },
    },
  },
}
