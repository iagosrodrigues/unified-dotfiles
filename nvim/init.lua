vim.env.FZF_DEFAULT_COMMAND = 'fd'
vim.env.SKIM_DEFAULT_COMMAND = 'fd'

-- Teej opt, see
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/lua/tj/globals
require('opt')

-- Some functions
require('utils')

-- Set global variables
require('globals')

-- Configure options
require('options')

-- Load packer.nvim files
require('plugins')

-- Load treesitter config
require('treesitter')

-- Builtin LSP
require('nvimlsp')

vim.cmd[[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]

local noamcore_bg_transparent = vim.fn.has('mac') == 0
local noamcore_wayland = false

if vim.fn.has('mac') == 1 then
  vim.g.python3_host_prog = '/usr/local/bin/python3'
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end

-- if noamcore_bg_transparent then
--   vim.cmd[[
--   highlight Normal guibg=none ctermbg=none
--   highlight FoldColumn guibg=none ctermbg=none
--   highlight SignColumn guibg=none
--   highlight EndOfBuffer guifg=bg guibg=none
--   highlight CursorLineNr guibg=none
--   highlight LineNr guibg=none
--   highlight SpecialKey ctermbg=none gui=none ctermfg=8 guifg=8
--   highlight NonText ctermbg=none gui=none ctermfg=8 guifg=8
--   highlight ErrorSign guibg=#3c3836 guifg=#fb4934
--   highlight WarningSign guibg=#3c3836 guifg=#fabd2f
--   highlight InfoSign guibg=#3c3836 guifg=#8ec07c
--   highlight Search guifg=#282a2e
--   highlight DiffAdd guibg=none
--   highlight DiffChange guibg=none
--   highlight DiffDelete guibg=none
--   highlight DiffText guibg=none
--   highlight IncSearch guibg=none guifg=#282a2e
--   highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold
--   highlight Conceal ctermbg=NONE
--   highlight Folded guifg=#838991 guibg=none
--   ]]
-- end
