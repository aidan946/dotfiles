vim.pack.add {
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.x' },
  'https://github.com/saghen/blink.compat',
  'https://github.com/fang2hou/blink-copilot',
  'https://github.com/nvim-mini/mini.snippets',
}
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpLua',
  callback = function()
    vim.opt_completeopt = { 'menu', 'menuone', 'noselect' }
  end,
})

require 'blink.compat'
require 'blink-copilot'

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup {}

require('blink.cmp').setup {
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
    default = { 'copilot', 'lsp', 'omni', 'path', 'snippets', 'buffer' },
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
}
