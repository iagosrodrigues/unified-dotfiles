local M = {}

-- Don't throw an error when not found
function M.import(module)
  pcall(require, module)
end

-- The function below is a simple wrapper for setting neovim options.
local function set_attr(object)
  local fn = function(table)
    for key, value in pairs(table) do
      object[key] = value
    end
  end

  return fn
end

M.set_opts = set_attr(vim.opt)
M.set_globals = set_attr(vim.g)

return M
