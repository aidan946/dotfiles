require 'aidan'

vim.filetype.add {
  filename = {
    ['go.work'] = 'gowork',
  },
  extension = {
    eex = 'eelixir',
    sface = 'surface',
    templ = 'templ',
    tmpl = 'gotmpl',
  },
  pattern = {
    ['.*%.go%.tmpl$'] = 'gotmpl',
    ['.*%.gotmpl$'] = 'gotmpl',
    ['.*%.surface$'] = 'surface',
  },
}
