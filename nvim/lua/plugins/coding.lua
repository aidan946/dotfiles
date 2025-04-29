return {
  -- Git signs
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
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },
  --NVIM TS Context Commentstring
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  -- Mini Comment
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
  { 'aidan946/ocaml.nvim', build = 'make' },
}
