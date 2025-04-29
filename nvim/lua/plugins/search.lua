return {
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      picker = {
        -- your picker configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
    keys = {
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch Document [d]iagnostics',
      },
      -- { '<leader>sD', '<cmd>FzfLua diagnostics_document<cr>', desc = '[S]earch Workspace [D]iagnostics' },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.recent()
        end,
        desc = '[S]earch Recent Files ("." for repeat)',
      },
      {
        '<leader><leader>',
        '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>',
        desc = '[ ] Find existing buffers',
      },
    },
  },
}
