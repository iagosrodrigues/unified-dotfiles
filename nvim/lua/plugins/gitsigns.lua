local map = require('support').maps
print('GitSign')

require('gitsigns').setup {

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local noremap = {
      noremap = true,
      silent = true,
    }

    local opts = { buffer = bufnr }

    map {
      n = {
        -- Navigation
        {']c', function ()
          if vim.wo.diff then return ']c' end
          vim.schedule(function ()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, noremap},
        {']c', function ()
          if vim.wo.diff then return ']c' end
          vim.schedule(function ()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, noremap},

        -- Actions
        {'<leader>hs', ':Gitsigns stage_hunk<cr>', opts},
        {'<leader>hr', ':Gitsigns reset_hunk<cr>', opts},
        {'<leader>hS', gs.stage_buffer, opts},
        {'<leader>hu', gs.undo_stage_hunk, opts},
        {'<leader>hR', gs.reset_buffer, opts},
        {'<leader>hp', gs.preview_hunk, opts},
        {'<leader>hb', function() gs.blame_line{full=true} end, opts},
        {'<leader>tb', gs.toggle_current_line_blame, opts},
        {'<leader>hd', gs.diffthis, opts},
        {'<leader>hD', function() gs.diffthis('~') end, opts},
        {'<leader>td', gs.toggle_deleted, opts},
      },
      v = {
        {'<leader>hs', ':Gitsigns stage_hunk<cr>', opts},
        {'<leader>hr', ':Gitsigns reset_hunk<cr>', opts},
      },

      -- Text object
      o = {
        {'ih', ':<C-U>Gitsigns select_hunk<CR>', opts}
      },
      x = {
        {'ih', ':<C-U>Gitsigns select_hunk<CR>', opts}
      }
    }
  end
}
