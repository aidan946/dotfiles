return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    init = function()
      local list = require('nvim-treesitter.parsers').get_parser_configs()
      list.reason = {
        install_info = {
          url = 'https://github.com/reasonml-editor/tree-sitter-reason',
          files = { 'src/parser.c', 'src/scanner.c' },
          branch = 'master',
        },
      }

      vim.treesitter.language.add('reason', { filetype = 'reason' })
    end,
    dependencies = {
      { 'reasonml-editor/tree-sitter-reason' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'nu' }, -- Ensure the "nu" parser is installed
        highlight = {
          enable = true, -- Enable syntax highlighting
        },
        -- OPTIONAL!! These enable ts-specific textobjects.
        -- So you can hit `yaf` to copy the closest function,
        -- `dif` to clear the content of the closest function,
        -- or whatever keys you map to what query.
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              -- For example:
              -- Nushell only
              ['aP'] = '@pipeline.outer',
              ['iP'] = '@pipeline.inner',

              -- supported in other languages as well
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
              ['aC'] = '@conditional.outer',
              ['iC'] = '@conditional.inner',
              ['iS'] = '@statement.inner',
              ['aS'] = '@statement.outer',
            }, -- keymaps
          }, -- select
        }, -- textobjects
      }
    end,
    build = ':TSUpdate',
  },
}
