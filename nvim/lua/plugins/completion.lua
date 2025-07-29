return {
  {
    'saghen/blink.cmp',
    version = '*',
    build = 'cargo build --release',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        lazy = true,
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
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
      'echasnovski/mini.icons',
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
    },
    event = 'InsertEnter',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        ghost_text = {
          enabled = false,
        },
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
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
          },
        },
      },
      signature = { enabled = true },
      snippets = {
        preset = 'luasnip',
      },
      keymap = {
        preset = 'default',
        ['<C-y>'] = { 'select_and_accept' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
      },
    },
  },
}
