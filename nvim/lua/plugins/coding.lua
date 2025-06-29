return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
    },
  },
  { 'tpope/vim-sleuth', event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' } },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    opts = {
      enable_autocmd = false,
    },
  },
  {
    'echasnovski/mini.comment',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    'aidan946/ocaml.nvim',
    build = 'make',
    event = 'VeryLazy',
  },
}
