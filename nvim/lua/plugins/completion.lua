return {
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        lazy = true,
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }
            end,
          },
        },
        opts = {
          history = true,
          delete_check_events = 'TextChanged',
        },
      },
      {
        'saghen/blink.compat',
        version = '*',
      },
      {
        'supermaven-inc/supermaven-nvim',
        opts = {
          disable_inline_completion = true,
          disable_keymaps = true,
        },
      },
      {
        'huijiro/blink-cmp-supermaven',
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
        default = { 'supermaven', 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },
        providers = {
          supermaven = {
            name = 'supermaven',
            module = 'blink-cmp-supermaven',
            async = true,
          },
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      signature = { enabled = true },
    },
  },
}
