local status, mason = pcall(require, "mason")
if not status then
  return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

local servers = {
  "clangd",
  "rust_analyzer",
  "pyright",
  "tsserver",
  "gopls",
  "tailwindcss",
  "yamlls",
  "taplo",
  "graphql",
  "elixirls",
  "dockerls",
  "bashls",
}

mason.setup({
  log_level = vim.log.levels.DEBUG
})

lspconfig.setup {
  ensure_installed = servers,
}
