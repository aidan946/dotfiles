return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
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
      -- NOTE: Additional parser
      { 'nushell/tree-sitter-nu' },
      { 'reasonml-editor/tree-sitter-reason' },
    },
  },
}
