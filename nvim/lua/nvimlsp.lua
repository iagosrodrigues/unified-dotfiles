local npairs = require('nvim-autopairs')

function _G.completion_confirm()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm'](npairs.esc('<cr>'))
    else
      return npairs.esc('<cr>')
    end
  else
    return npairs.autopairs_cr()
  end
end

local global = {
    completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'},
    airline_section_c = "%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%{airline#util#wrap(v:lua.lsp_progress(),0)}%#__restore__#%#__accent_bold#%#__restore__#",
}

-- {lhs, rhs, options}
-- options: noremap = 1, silent = 2, expr = 4, nowait = 8
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
    {'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', 3},
    {'g[', '<cmd>PrevDiagnosticCycle<CR>', 3},
    {'g]', '<cmd>NextDiagnosticCycle<CR>', 3},
    {'<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', 3},
    -- {'<leader>f', '<cmd>Neoformat<CR>', 3},
    {'<leader>sd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 3},
  },
  i = {
    {'<c-space>', 'compe#complete()', 7},
    {'<cr>', 'v:lua.completion_confirm()', 7},
    {'<c-e>', 'compe#close("<c-e>")', 7},
    {'<c-f>', 'compe#scroll({"delta":+4})', 7},
    {'<c-d>', 'compe#scroll({"delta":-4})', 7},
    {'<tab>', 'pumvisible() ? "<C-n>" : "<tab>"', 5},
    {'<S-tab>', 'pumvisible() ? "<C-p>" : "<S-tab>"', 5},
  }
}

return {
  global = global,
  maps = maps,
}
