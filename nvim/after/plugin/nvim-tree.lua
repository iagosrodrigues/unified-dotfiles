local loaded, nvim_tree = pcall(require, "nvim-tree")

if not loaded then
  return
end

--[[ vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 ]]
nvim_tree.setup()
