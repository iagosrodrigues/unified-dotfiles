local utils = require('../utils')

utils.remap {
  n = {
    {'<leader>k', ':Explore<CR>', {noremap = true, silent = true}},
  }
}
