local fn, lsp, api = vim.fn, vim.lsp, vim.api

function tabline()
  tabs = vim.api.nvim_list_tabpages()
  nerdfont = vim.fn["nerdfont#find"]
  str = ''
  for i, v in pairs(tabs) do
    if i+1 == vim.api.nvim_tabpage_get_number(0) then
      str = str .. '%#TabLineSel#'
    else
      str = str .. '%#TabLine#'
    end
    str = str .. '%' .. i+1 .. 'T ' .. nerdfont() .. ' %{v:lua.tabname(' .. i+1 .. ')} '
  end
  str = str .. '%#TabLineFill#%T %=%#TabLine#%999XX'
  return string.format('%s', str)
end

function tabname(n)
  winnr = vim.api.nvim_win_get_number(n)
  return vim.api.nvim_buf_get_name(vim.api.nvim_list_bufs()[n-1]):match("^.+/(.+)$") or '[New file]'
end

-- vim.o.tabline = string.format('%s', '%!v:lua.tabline()')

local modes_text = {
  R = 'REPLACE',
  Rv = 'VIRTUAL',
  S = 'SELECT',
  V = 'VISUAL LINE',
  [''] = 'SELECT',
  [''] = 'VISUAL BLOCK',
  ['!'] = 'SHELL',
  ['r?'] = ':CONFIRM',
  c = 'CMD',
  cv = 'EX',
  i = 'INSERT',
  ic = 'INS-COMPLETE',
  n = 'NORMAL',
  no = 'OPERATOR PENDING',
  r = 'HIT-ENTER',
  rm = '--MORE',
  s = 'SELECT',
  t = 'TERMINAL',
  v = 'VISUAL',
}

local function capitalize(s)
  return s:sub(1,1):upper()..s:sub(2)
end

local function get_coc_diagnostic(diag_type)
  if diag_type == 'info' then
    diag_type = 'information'
  end

  local has_info, info = pcall(fn.nvim_buf_get_var, 0, 'coc_diagnostic_info')
  if not has_info then
    return nil
  end

  if info[diag_type] > 0 then
    return info[diag_type]
  end

  return nil
end

local function get_nvim_lsp_diagnostic(diag_type)
  if next(lsp.buf_get_clients(0)) == nil then
    return nil
  end

  local active_clients = lsp.get_active_clients()

  if active_clients then
    local count = 0

    for _, client in ipairs(active_clients) do
      count = count + lsp.diagnostic.get_count(api.nvim_get_current_buf(), capitalize(diag_type), client.id)
    end

    if count ~= 0 then
      return count
    end
  end

  return nil
end

function status_line()
  local handler = nil
  local line = ''

  if fn.exists('*coc#rpc#start_server') == 1 then
    handler = get_coc_diagnostic
  elseif not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    handler = get_nvim_lsp_diagnostic
  end

  local icons = {'', '', '', ''}
  local colors = {
    '%#LspDiagnosticsDefaultError#',
    '%#LspDiagnosticsDefaultWarning#',
    '%#LspDiagnosticsDefaultHint#',
    '%#LspDiagnosticsDefaultInfo#'
  }

  if handler then
    for index, type in ipairs({'error', 'warning', 'hint', 'info'}) do
      count = handler(type)

      if count and count > 0 then
        line = line .. '' .. colors[index] .. ' ' .. icons[index] .. ' ' .. count .. '%#LineNr#'
      end
    end
    return line
  end

  return ''
end

function mode_text()
  return modes_text[fn.mode()]
end

function status()
  return string.format(
    '%s',
    "%#CursorColumn# " .. mode_text() .. " %f " .. status_line() .. " %m %=%#CursorColumn# %y %{&fileencoding?&fileencoding:&encoding} [%{&fileformat}] %p%% %l:%c ")
end

vim.o.statusline = '%!v:lua.status()'
vim.wo.statusline = '%!v:lua.status()'
