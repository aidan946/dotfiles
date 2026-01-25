return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    cmd = { 'TSUpdate', 'TSInstall', 'TSLog', 'TSUninstall' },
    opts_extend = { 'ensure_installed' },
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
    },
    config = function(_, opts)
      local TS = require 'nvim-treesitter'

      setmetatable(require 'nvim-treesitter.install', {
        __newindex = function(_, k)
          if k == 'compilers' then
          end
        end,
      })

      TS.setup(opts)
      VimConfig.treesitter.get_installed(true)

      local install = vim.tbl_filter(function(lang)
        return not VimConfig.treesitter.have(lang)
      end, opts.ensure_installed or {})
      if #install > 0 then
        VimConfig.treesitter.build(function()
          TS.install(install, { summary = true }):await(function()
            VimConfig.treesitter.get_installed(true)
          end)
        end)
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('vimconfig_treesitter', { clear = true }),
        callback = function(ev)
          local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
          if not VimConfig.treesitter.have(ft) then
            return
          end

          ---@param feat string
          ---@param query string
          local function enabled(feat, query)
            local f = opts[feat] or {}
            return f.enable ~= false and not (type(f.disable) == 'table' and vim.tbl_contains(f.disable, lang)) and VimConfig.treesitter.have(ft, query)
          end

          if enabled('highlight', 'highlights') then
            pcall(vim.treesitter.start, ev.buf)
          end

          if enabled('indent', 'indents') then
            VimConfig.set_default('indentexpr', 'v:lua.VimConfig.treesitter.indentexpr()')
          end

          if enabled('folds', 'folds') then
            if VimConfig.set_default('foldmethod', 'expr') then
              VimConfig.set_default('foldexpr', 'v:lua.VimConfig.treesitter.foldexpr()')
            end
          end
        end,
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
    config = function(_, opts)
      local TS = require 'nvim-treesitter-textobjects'
      TS.setup(opts)

      local function attach(buf)
        local ft = vim.bo[buf].filetype
        if not (vim.tbl_get(opts, 'move', 'enable') and VimConfig.treesitter.have(ft, 'textobjects')) then
          return
        end
        ---@type table<string, table<string, string>>
        local moves = vim.tbl_get(opts, 'move', 'keys') or {}

        for method, keymaps in pairs(moves) do
          for key, query in pairs(keymaps) do
            local queries = type(query) == 'table' and query or { query }
            local parts = {}
            for _, q in ipairs(queries) do
              local part = q:gsub('@', ''):gsub('%..*', '')
              part = part:sub(1, 1):upper() .. part:sub(2)
              table.insert(parts, part)
            end
            local desc = table.concat(parts, ' or ')
            desc = (key:sub(1, 1) == '[' and 'Prev ' or 'Next ') .. desc
            desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and ' End' or ' Start')
            if not (vim.wo.diff and key:find '[cC]') then
              vim.keymap.set({ 'n', 'x', 'o' }, key, function()
                require('nvim-treesitter-textobjects.move')[method](query, 'textobjects')
              end, {
                buffer = buf,
                desc = desc,
                silent = true,
              })
            end
          end
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('lazyvim_treesitter_textobjects', { clear = true }),
        callback = function(ev)
          attach(ev.buf)
        end,
      })
      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },
}
