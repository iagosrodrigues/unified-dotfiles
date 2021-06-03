local set_attr = require('utils').set_attr

local env = {
  FZF_DEFAULT_COMMAND = 'fd',
  SKIM_DEFAULT_COMMAND = 'fd'
}

set_attr(vim.env)(env)
