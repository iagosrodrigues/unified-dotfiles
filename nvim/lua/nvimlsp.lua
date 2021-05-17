local lsp = require('lspconfig')

require'compe'.setup {
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

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local servers = {
    'clangd',
    'cmake',
    'elixirls',
    'rust_analyzer',
    'sumneko_lua',
    'texlab',
    'tsserver',
    'vimls',
}

local servers_settings = {
  rust_analyzer = {
    updates = {
      channel = "nightly"
    },
  },
  elixirls = {
    projectDir = ".",
  },
  sumneko_lua = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        }
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

local sumneko_root
local sumneko_binary

if vim.fn.has('mac') == 1 then
  sumneko_root = vim.fn.expand('~/Projects/lua-language-server')
  sumneko_binary = sumneko_root .. '/bin/macOS/lua-language-server'
elseif vim.fn.has('unix') == 1 then
  sumneko_root = vim.fn.expand('~/Projects/lua-language-server')
  sumneko_binary = sumneko_root .. '/bin/Linux/lua-language-server'
end

local commands = {
  sumneko_lua = {
    sumneko_binary, '-E', sumneko_root .. '/main.lua'
  },
  elixirls = { '/usr/local/bin/elixir-ls/language_server.sh' }
}

for _, server in ipairs(servers) do
    lsp[server].setup({
        on_attach = on_attach,
        settings = servers_settings[server],
        cmd = commands[server],
    })
end

set_globals {
    completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'},
    airline_section_c = "%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%{airline#util#wrap(v:lua.lsp_progress(),0)}%#__restore__#%#__accent_bold#%#__restore__#",
}

-- {lhs, rhs, options}
-- options: noremap = 1, silent = 2, expr = 4, nowait = 8
set_mappings {
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
