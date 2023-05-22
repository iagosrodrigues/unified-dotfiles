local status, n = pcall(require, "github-theme")
if not status then
  return
end

--[[ n.setup({
  transparent = false,
  theme_style = vim.o.background
}) ]]
