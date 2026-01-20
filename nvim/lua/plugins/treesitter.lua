return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
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
      vim.api.nvim_create_autocmd('User', {
        pattern = 'TSUpdate',
        once = false,
        callback = function()
          local parser_config = require 'nvim-treesitter.parsers'

          parser_config.mojo = {
            install_info = {
              url = 'https://github.com/lsh/tree-sitter-mojo.git',
              files = { 'src/parser.c', 'src/scanner.c' },
              branch = 'main',
              requires_generate_from_grammar = false,
            },
            tier = 3,
          }

          parser_config.reason = {
            install_info = {
              url = 'https://github.com/reasonml-editor/tree-sitter-reason',
              files = { 'src/parser.c', 'src/scanner.c' },
              branch = 'master',
            },
            tier = 3,
          }
        end,
      })

      vim.treesitter.language.register('mojo', { 'mojo', '🔥' })
      vim.treesitter.language.register('reason', 'reason')
    end,
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
    dependencies = {
      { 'reasonml-editor/tree-sitter-reason' },
    },
  },
}
