return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'nu', 'query', 'regex', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      folds = { enable = true },
    },
    init = function()
      local list = require('nvim-treesitter.parsers').get_parser_configs()
      listareason = {
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
}
