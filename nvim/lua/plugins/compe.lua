local utils = require('../utils')

local noremap = {
  noremap = true
}

local noremap_expr = {
  noremap = true,
  expr = true
}

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_legth = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

utils.remap {
  i = {
    {'<c-space>', 'compe#complete()', noremap_expr},
    {'<c-e>', 'compe#close("<c-e>")', noremap_expr},
    {'<c-f>', 'compe#scroll({"delta":+4})', noremap_expr},
    {'<c-d>', 'compe#scroll({"delta":-4})', noremap_expr},
  }
}
