vim.pack.add { 'https://github.com/nvimdev/dashboard-nvim' }

local logo = [[
                                    ██    ██    ██                                    
                                  ██      ██  ██                                      
                                  ██    ██    ██                                      
                                    ██  ██      ██                                    
                                    ██    ██    ██                                    
                                                                                      
                                ████████████████████                                  
                                ██                ██████                              
                                ██                ██  ██                              
                                ██                ██  ██                              
                                ██                ██████                              
                                  ██            ██                                    
                              ████████████████████████                                
                              ██                    ██                                
                                ████████████████████                                  
                                                                                      
                                                                                      
    ]]

logo = string.rep('\n', 8) .. logo .. '\n\n'

local opts = {
  theme = 'doom',
  hide = {
    statusline = false,
  },
  config = {
    header = vim.split(logo, '\n'),
    center = {
      { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
      { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = ' ', key = 's', desc = 'Restore Session', action = ':lua require("persistence").load()' },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    footer = {},
  },
}

for _, button in ipairs(opts.config.center) do
  button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
  button.key_format = '  %s'
end

require('dashboard').setup(opts)
