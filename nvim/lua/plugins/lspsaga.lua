local remap = require('utils').remap

local noremap = {
  noremap = true
}

remap {
  n = {
    {'<F2>', "<cmd>lua require('lspsaga.rename').rename()<CR>", noremap},
    {'<M-d>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", noremap},
    {'<c-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", noremap},
    {'<c-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", noremap},
    {'<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", noremap},
    {'<leader>cd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", noremap},
    {'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", noremap},
    {'[e', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", noremap},
    {']e', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", noremap},
    {'gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", noremap},
    {'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", noremap},
  },
  t = {
    {'<M-d>', "<c-\\><c-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>", noremap},
  },
  v = {
    {'<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", noremap},
  }
}
