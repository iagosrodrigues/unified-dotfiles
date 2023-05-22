local support = require('support')
local status, n = pcall(require, 'rose-pine')
if (not status) then return end

support.set_opts {
  cursorline = true,
  termguicolors = true,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  background = "dark"
}

-- vim.cmd "colorscheme embark"
--[[
n.setup({
  transparent_background = true,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = true,
    mini = true
  }
})

n.setup({
  dark_variant = 'moon',
  ligh_variant = 'dawn',
  disable_background = true
}) ]]

vim.cmd.colorscheme('kanagawa')
