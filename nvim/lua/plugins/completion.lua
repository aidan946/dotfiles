return {
  -- Blink
  {
    'saghen/blink.cmp',
    version = '*',
    build = 'cargo build --release',
    opts_extend = {
      'sources.completion.enabled_providers',
      'sources.compat',
      'sources.default',
    },
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'saghen/blink.compat',
        opts = {},
        version = '*',
      },
      'echasnovski/mini.icons',
      --[[      'giuxtaposition/blink-cmp-copilot', ]]
    },
    event = 'InsertEnter',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              },
            },
            treesitter = { 'lsp' },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        compat = {
          'avante_commands',
          'avante_mentions',
          'avante_files',
        },
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'avante_commands', 'avante_mentions', 'avante_files' },
        providers = {
          -- copilot = {
          --   name = 'copilot',
          --   module = 'blink-cmp-copilot',
          --   score_offset = 100,
          --   async = true,
          -- },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
          },
          avante_commands = {
            name = 'avante_commands',
            module = 'blink.compat.source',
            score_offset = 90,
            opts = {},
          },
          avante_files = {
            name = 'avante_files',
            module = 'blink.compat.source',
            score_offset = 100,
            opts = {},
          },
          avante_mentions = {
            name = 'avante_mentions',
            module = 'blink.compat.source',
            score_offset = 1000,
            opts = {},
          },
        },
      },
      keymap = {
        preset = 'default',
        ['<C-y>'] = { 'select_and_accept' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.default
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend('force', { name = source, module = 'blink.compat.source' }, opts.sources.providers[source] or {})
        if type(enabled) == 'table' and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end

      -- Unset custom prop to pass blink.cmp validation
      opts.sources.compat = nil

      require('blink.cmp').setup(opts)
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
