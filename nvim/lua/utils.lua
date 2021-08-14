local set_attr = function (obj)
  local fn = function (table)
    for key, value in pairs(table) do
      obj[key] = value
    end
  end

  return fn
end

local remap = function (mapping_table)
  for mode, mappings in pairs(mapping_table) do
    for _, value in pairs(mappings) do
      vim.api.nvim_set_keymap(mode, value[1], value[2], value[3] or {})
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

function sort_by_length()
  local _, csrow, _, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, _, _ = unpack(vim.fn.getpos("'>"))

  csrow = csrow - 1

  local content = vim.api.nvim_buf_get_lines(0, csrow, cerow, false)

  table.sort(content, function(a,b) return #a<#b end)

  vim.api.nvim_buf_set_lines(0, csrow, cerow, false, content)
end

local make_transparent = function ()
  vim.cmd[[
  highlight Normal guibg=none ctermbg=none
  highlight FoldColumn guibg=none ctermbg=none
  highlight SignColumn guibg=none
  highlight EndOfBuffer guifg=bg guibg=none
  highlight CursorLineNr guibg=none
  highlight LineNr guibg=none
  highlight SpecialKey ctermbg=none gui=none ctermfg=8 guifg=8
  highlight NonText ctermbg=none gui=none ctermfg=8 guifg=8
  highlight ErrorSign guibg=#3c3836 guifg=#fb4934
  highlight WarningSign guibg=#3c3836 guifg=#fabd2f
  highlight InfoSign guibg=#3c3836 guifg=#8ec07c
  highlight Search guifg=#282a2e
  highlight DiffAdd guibg=none
  highlight DiffChange guibg=none
  highlight DiffDelete guibg=none
  highlight DiffText guibg=none
  highlight IncSearch guibg=none guifg=#282a2e
  highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold
  highlight Conceal ctermbg=NONE
  highlight Folded guifg=#838991 guibg=none
  ]]
end

return {
  remap = remap,
  set_opts = set_attr(vim.opt),
  set_globals = set_attr(vim.g),
  set_attr = set_attr,
  make_transparent = make_transparent,
}
