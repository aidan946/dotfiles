return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local filetypes = { 'bash', 'c', 'clojure', 'cmake', 'cpp', 'css', 'diff', 'eex', 'elixir', 'embedded_template',
        'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitignore', 'gleam', 'go', 'gomod', 'gosum', 'gotmpl',
        'heex', 'haskell', 'html', 'html_tags', 'javascript', 'json', 'lua', 'luadoc', 'make', 'markdown',
        'markdown_inline', 'nu',
        'ocaml', 'ocaml_interface', 'ocamllex', 'odin', 'python', 'query', 'regex', 'ruby', 'rust', 'sql', 'templ',
        'tmux', 'typescript', 'vim', 'vimdoc', 'vue', 'yaml', 'zsh', 'zig' }
      require('nvim-treesitter').install(filetypes)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = 'VeryLazy',
    opts = {
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
    },
  },
}
