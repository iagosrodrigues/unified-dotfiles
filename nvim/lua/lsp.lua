local nvim_lsp = require'lspconfig'

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

-- local completion = require'completion'

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
    'tsserver',
    'vimls',
    'rust_analyzer',
    'elixirls',
    'clangd',
    'cmake',
    'texlab',
}

local servers_settings = {
  rust_analyzer = {
    updates = {
      channel = "nightly"
    },
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

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, '-E', sumneko_root .. '/main.lua'};
  settings = {
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

for _, server in ipairs(servers) do
    nvim_lsp[server].setup({
        on_attach = on_attach,
        settings = vim.tbl_deep_extend('force', nvim_lsp.util.default_config, servers_settings[server] or {}),
    })
end
