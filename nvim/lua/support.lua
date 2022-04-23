-- File containing support files

local M = {}

-- Dont throw an error when not found
function M.req(module)
  pcall(require, module)
end

function M.set_attr(obj)
  local fn = function (table)
    for key, value in pairs(table) do
      obj[key] = value
    end
  end

  return fn
end

function M.map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.maps(mapping_table)
  for mode, mappings in pairs(mapping_table) do
    for _, value in pairs(mappings) do
      vim.keymap.set(mode, value[1], value[2], value[3] or {})
    end
  end
end

function M.check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function M.sort_by_length()
  local _, csrow, _, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, _, _ = unpack(vim.fn.getpos("'>"))

  csrow = csrow - 1

  local content = vim.api.nvim_buf_get_lines(0, csrow, cerow, false)

  table.sort(content, function(a,b) return #a<#b end)

  vim.api.nvim_buf_set_lines(0, csrow, cerow, false, content)
end

return M

--[[ return {
  remap = remap,
  set_opts = set_attr(vim.opt),
  set_globals = set_attr(vim.g),
  set_attr = set_attr,
} ]]
