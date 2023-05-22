local mason_loaded, mason = pcall(require, "mason")
if not mason_loaded then
  return
end
local lspconfig_loaded, lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_loaded then
  return
end

mason.setup {}

lspconfig.setup {
  automatic_installation = true,
}
