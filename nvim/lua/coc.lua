local global = {
  coc_global_extensions = {
    'coc-rust-analyzer',
    'coc-pairs',
    'coc-tsserver',
    'coc-eslint',
    'coc-prettier',
    'coc-json',
  },
  coc_snippet_next = '<tab>',
}

-- {lhs, rhs, options}
-- options: noremap = 1, silent = 2, expr = 4, nowait = 8
local maps = {
  n = {
    {'<leader>b', ':CocList buffers<cr>', 1},
    {'K', ':call Show_documentation()<CR>', 2},
    {'<leader>te', ':call CocAction("runCommand", "jest.singleTest")<CR>', 1},

    {'<leader>o', ':<c-u>CocList outline<CR>', 10},

    {'[c', '<Plug>(coc-diagnostic-prev)', 0},
    {']c', '<Plug>(coc-diagnostic-next)', 0},

    {'[g', '<Plug>(coc-git-prevchunk)', 0},
    {']g', '<Plug>(coc-git-nextchunk)', 0},

    {'gs', '<Plug>(coc-git-chunkinfo)', 0},

    {'<c-s>', '<Plug>(coc-range-select)', 2},

    {'<leader>a', '<Plug>(coc-codeaction-selected)', 0},
    {'<leader>ac', '<Plug>(coc-codeaction)', 0},
    {'<leader>qf', '<Plug>(coc-fix-current)', 0},

    {'gd', '<Plug>(coc-definition)', 2},
    {'gy', '<Plug>(coc-type-definition)', 2},
    {'gi', '<Plug>(coc-implementation)', 2},
    {'gr', '<Plug>(coc-references)', 2},

    {'<F2>', '<Plug>(coc-rename)', 0},

    {'<leader>f', '<Plug>(coc-format)', 0},

    {'<tab>', '<Plug>(coc-range-select)', 2},
  },
  i = {
    {'<cr>', 'complete_info()["selected"] != "-1" ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', 7},

    {'<tab>', 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<tab>" : coc#refresh()', 7},
    {'<s-tab>', 'pumvisible() ? "<C-p>" : "<c-h>"', 7},
    {'<c-space>', 'coc#refresh()', 7},
  },
  o = {
    {'ig', '<Plug>(coc-git-chunk-inner)', 0},
    {'ag', '<Plug>(coc-git-chunk-outer)', 0},

    {'if', '<Plug>(coc-funcobj-i)', 0},
    {'af', '<Plug>(coc-funcobj-a)', 0},
    {'ac', '<Plug>(coc-classobj-a)', 0},
    {'ic', '<Plug>(coc-classobj-i)', 0},
  },
  x = {
    {'ig', '<Plug>(coc-git-chunk-inner)', 0},
    {'ag', '<Plug>(coc-git-chunk-outer)', 0},
    {'<leader>a', '<Plug>(coc-codeaction-selected)', 0},

    {'if', '<Plug>(coc-funcobj-i)', 0},
    {'af', '<Plug>(coc-funcobj-a)', 0},
    {'ac', '<Plug>(coc-classobj-a)', 0},
    {'ic', '<Plug>(coc-classobj-i)', 0},

    {'<c-s>', '<Plug>(coc-range-select)', 2},

    {'<leader>f', '<Plug>(coc-format-selected)', 0},

    {'<tab>', '<Plug>(coc-range-select)', 2},
    {'<s-tab>', '<Plug>(coc-range-select-backword)', 2},
  }
}

return {
  global = global,
  maps = maps
}
