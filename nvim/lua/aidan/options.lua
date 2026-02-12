vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.opt.relativenumber = true

vim.o.mouse = 'a'

vim.opt.showmode = false

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.breakindent = true
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.conceallevel = 1
vim.o.termguicolors = true

vim.o.expandtab = true

vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldtext = ''
vim.o.foldenable = false
vim.o.foldlevel = 99
