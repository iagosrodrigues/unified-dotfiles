local utils = require('../utils')

utils.remap {
  [''] = {
    {'f', '<cmd>lua require"hop".hint_char1()<cr>'},
    {'<m-f>', '<cmd>lua require"hop".hint_char2()<cr>'},
  }
}
