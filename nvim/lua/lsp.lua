local nvim_lsp = require'lspconfig'
-- local lsp_status = require'lsp-status'

-- lsp_status.register_progress()

-- function lsp_progress()
--   if #vim.lsp.buf_get_clients(0) > 0 then
--     return lsp_status.status()
--   end

--   return ''
-- end

-- lsp_status.config({
--   indicator_errors = 'E',
--   indicator_warnings = 'W',
--   indicator_info = 'i',
--   indicator_hint = '?',
--   indicator_ok = 'Ok',
--   status_symbol = '',
-- })

local completion = require'completion'

local on_attach = function(client)
  -- lsp_status.on_attach(client)
  completion.on_attach(client)
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

servers_settings = {
  rust_analyzer = {
    updates = {
      channel = "nightly"
    },
  }
}

for _, server in ipairs(servers) do
    nvim_lsp[server].setup({
        on_attach = on_attach,
        -- capabilities = lsp_status.capabilities,
        settings = servers_settings[server],
    })
end
