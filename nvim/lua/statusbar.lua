local coc_status = function()
    local status = vim.call('coc#status')
    local fn = vim.b['coc_current_function'] or ''

    return ' ' .. status .. ' ' .. fn
end

local generator = function(win_id)
    local segments = {}
    local extensions = require'el.extensions'
    local builtin = require'el.builtin'
    local helper = require'el.helper'
    local lspstatus = require'el.plugins.lsp_status'

    table.insert(segments, extensions.mode)
    if coc then
      table.insert(segments, coc_status)
    else
      table.insert(segments, lspstatus.segment)
    end
    table.insert(segments, ' %f%m%r%=%#CursorColumn# %y %{&fileencoding?&fileencoding:&encoding} [%{&fileformat}] %p%% %l:%c')

    -- table.insert(el_segments, helper.async_buf_setter(
    --     win_id,
    --     'el_git_stat',
    --     extensions.git_changes,
    --     5000
    --  ))

    return segments
end

require('el').setup { generator = generator }
