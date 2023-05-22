local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    diagnostics.fish,
    formatting.prettierd,
    formatting.black.with({
      args = { "--line-length", "120", "--fast" },
    }),
    formatting.stylua,
    diagnostics.flake8
  }
})
