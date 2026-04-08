vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/andymass/vim-matchup',
}

local parsers = {
  'bash',
  'c',
  'cmake',
  'cpp',
  'css',
  'diff',
  'eex',
  'elixir',
  'embedded_template',
  'fish',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitignore',
  'gleam',
  'go',
  'gomod',
  'gosum',
  'gotmpl',
  'heex',
  'haskell',
  'html',
  'html_tags',
  'javascript',
  'json',
  'latex',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'nu',
  'ocaml',
  'ocaml_interface',
  'ocamllex',
  'odin',
  'python',
  'query',
  'regex',
  'ruby',
  'rust',
  'scss',
  'sql',
  'svelte',
  'templ',
  'tmux',
  'tsx',
  'typescript',
  'typst',
  'vim',
  'vimdoc',
  'vue',
  'yaml',
  'zsh',
  'zig',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function(event)
    if event.match ~= 'minifiles' then
      vim.treesitter.start()
    end
  end,
})

require('nvim-treesitter-textobjects').setup {
  move = {
    enable = true,
    set_jumps = true,
    keys = {
      goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
      goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
      goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
      goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
    },
  },
}
