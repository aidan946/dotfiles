return {
  {
    'ThePrimeagen/99',
    keys = {
      {
        '<leader>9v',
        function()
          require('99').visual()
        end,
        mode = { 'v', 'x' },
        desc = '99: visual replace selection',
      },
      {
        '<leader>9x',
        function()
          require('99').stop_all_requests()
        end,
        desc = '99: stop all requests',
      },
      {
        '<leader>9s',
        function()
          require('99').search()
        end,
        desc = '99: search',
      },
    },
    config = function()
      local _99 = require '99'

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup {
        provider = _99.Providers.OpenCodeProvider,
        model = 'github-copilot/claude-sonnet-4.6',
        logger = {
          level = _99.DEBUG,
          path = '/tmp/' .. basename .. '.99.debug',
          print_on_error = true,
        },
        tmp_dir = './tmp',

        completion = {
          source = 'blink',
        },

        md_files = {
          'AGENT.md',
        },
      }
    end,
  },
}
