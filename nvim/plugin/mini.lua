vim.pack.add {
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
}
require('mini.surround').setup()

local ai = require 'mini.ai'
require('mini.ai').setup {
  n_lines = 500,
  custom_textobjects = {
    o = ai.gen_spec.treesitter { -- code block
      a = { '@block.outer', '@conditional.outer', '@loop.outer' },
      i = { '@block.inner', '@conditional.inner', '@loop.inner' },
    },
    f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }, -- function
    c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }, -- class
    t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
    d = { '%f[%d]%d+' }, -- digits
    e = { -- Word with case
      { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
      '^().*()$',
    },
    u = ai.gen_spec.function_call(), -- u for "Usage"
    U = ai.gen_spec.function_call { name_pattern = '[%w_]' }, -- without dot in function name
  },
}

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

local lazy_load_mini_comment = function()
  require('mini.comment').setup {
    options = {
      custom_commentstring = function()
        return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
      end,
    },
  }

  vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
      vim.api.nvim_del_augroup_by_name 'lazy_load_mini_comment'
    end,
    group = vim.api.nvim_create_augroup('lazy_load_mini_comment', { clear = false }),
  })
end

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile', 'BufWritePre' }, {
  callback = lazy_load_mini_comment,
  group = vim.api.nvim_create_augroup('lazy_load_mini_comment', { clear = false }),
})

require('mini.cursorword').setup {}

require('mini.diff').setup {
  view = {
    style = 'sign',
    signs = {
      add = '▎',
      change = '▎',
      delete = '',
    },
  },
}

vim.keymap.set('n', '<leader>go', function()
  require('mini.diff').toggle_overlay(0)
end, { desc = 'Toggle mini.diff overlay' })

require('mini.files').setup {
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 50,
  },
}

vim.keymap.set('n', '<leader>e', function()
  require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
end, { desc = 'Open file explorer' })

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesActionRename',
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

require('mini.icons').setup {
  file = {
    ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
    ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
  },
  filetype = {
    dotenv = { glyph = '', hl = 'MiniIconsYellow' },
  },
}
package.preload['nvim-web-devicons'] = function()
  require('mini.icons').mock_nvim_web_devicons()
  return package.loaded['nvim-web-devicons']
end

require('mini.jump').setup {}
require('mini.move').setup {}
require('mini.pairs').setup {}
