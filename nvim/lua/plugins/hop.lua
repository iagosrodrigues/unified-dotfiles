local utils = require('../utils')

require'hop'.setup()

utils.remap {
  [''] = {
    {'f', '<cmd>lua require"hop".hint_char1()<cr>'},
    {'<m-f>', '<cmd>lua require"hop".hint_char2()<cr>'},
  }
}
