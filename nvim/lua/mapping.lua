local utils = require('../utils')

local noremap = {
  noremap = true,
  silent = true
}

utils.remap {
  n = {
    {'<leader>ev', ':e $MYVIMRC<cr>', noremap},
    {'<leader>[', '<<', noremap},
    {'<leader>]', '>>', noremap},

    {'<C-h>', '<C-w>h', noremap},
    {'<C-j>', '<C-w>j', noremap},
    {'<C-k>', '<C-w>k', noremap},
    {'<C-l>', '<C-w>l', noremap},

    {'<leader>C-]>', '<C-w><C-]><C-w>T', noremap},

    {'<leader>h', ':diffget noremap<CR>', noremap},
    {'<leader>l', ':diffget 2<CR>', noremap},
    {'<leader>k', ':Explore<CR>', noremap},
  },

  v = {
    {'>', '>gv', noremap},
    {'<', '<gv', noremap},
    {'<leader>[', '<gv', noremap},
    {'<leader>]', '>gv', noremap},
    {'<leader>su', ':lua sort_by_length()<CR>', noremap},
  },

  x = {
    {'Y', '"+y', noremap},
  }
}
