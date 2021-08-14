local utils = require('utils')

utils.remap {
  n = {
    {'<leader>m', '<cmd>lua require("harpoon.mark").add_file()<CR>', {noremap = true}},
    {'<leader>n1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true}},
    {'<leader>n2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', {noremap = true}},
    {'<leader>ne', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true}},
    {'<leader>t1', '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>', {noremap = true}},
    {'<leader>t2', '<cmd>lua require("harpoon.term").gotoTerminal(2)<CR>', {noremap = true}}
  }
}
