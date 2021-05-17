local npairs = require('nvim-autopairs')

function set_opts(opts_table)
  for k, v in pairs(opts_table) do
    vim.opt[k] = v
  end
end

function set_globals(global_table)
  for k, v in pairs(global_table) do
    vim.g[k] = v
  end
end

function set_mappings(mapping_table)
  for mode, mappings in pairs(mapping_table) do
    for key, value in pairs(mappings) do
      local lhs = value[1]
      local rhs = value[2]
      local options = value[3]

      -- TODO Must rewrite this crap
      local check_bit = function(bit)
        return vim.fn['and'](options, bit) > 0
      end

      vim.api.nvim_set_keymap(
        mode,
        lhs,
        rhs,
        {
          noremap = check_bit(1),
          silent = check_bit(2),
          expr = check_bit(4),
          nowait = check_bit(8),
        }
      )
    end
  end
end

function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function completion_confirm()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm'](npairs.esc('<cr>'))
    else
      return npairs.esc('<cr>')
    end
  else
    return npairs.autopairs_cr()
  end
end

function SortByLength()
  local _, csrow, _, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, _, _ = unpack(vim.fn.getpos("'>"))

  csrow = csrow - 1
  cerow = cerow + 1

  local content = vim.api.nvim_buf_get_lines(0, csrow, cerow, false)

  table.sort(content, function(a,b) return #a<#b end)

  vim.api.nvim_buf_set_lines(0, csrow, cerow, false, content)
end
