local utils = require('utils')

local noremap = {
  noremap = true
}

utils.remap {
  n = {
    {'<C-p>', "<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>", noremap},
    {'<leader>pf', "<cmd>lua require('telescope.builtin').find_files()<CR>", noremap},
    {'<leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>", noremap},
  }
}
