local global = {
    completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'},
    airline_section_c = "%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%{airline#util#wrap(v:lua.lsp_progress(),0)}%#__restore__#%#__accent_bold#%#__restore__#",
}

local maps = {
  n = {
    {'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 3},
    {'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 3},
    {'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 3},
    {'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 3},
    {'gr', '<cmd>lua vim.lsp.buf.references()<CR>', 3},
    {'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 3},
    {'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 3},
    {'<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', 3},
    -- {'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', 3},
    {'g[', '<cmd>PrevDiagnosticCycle<CR>', 3},
    {'g]', '<cmd>NextDiagnosticCycle<CR>', 3},
    {'<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', 3},
    {'<leader>sd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 3},
  },
  i = {
    {'<tab>', 'pumvisible() ? "<C-n>" : "<tab>"', 7},
    {'<S-tab>', 'pumvisible() ? "<C-p>" : "<S-tab>"', 7},
  }
}

return {
  global = global,
  maps = maps,
}
