local remap = require('utils').remap

local noremap = {
  noremap = true
}

remap {
  n = {
    {'<leader>u', ':UndotreeShow<CR>', noremap},
  }
}
