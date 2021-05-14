local options = {
  autoindent = true,
  autoread = true,
  background = "dark",
  backspace = 'indent,eol,start',
  backup = false,
  belloff = 'all',
  breakindent = true,
  bufhidden = 'unload',
  clipboard = "unnamedplus",
  cmdheight = 2,
  compatible = false,
  completeopt = 'menuone,noinsert,noselect',
  conceallevel = 2,
  copyindent = true,
  cursorline = true,
  diffopt = 'internal,filler,closeoff,context:4,vertical',
  equalalways = false,
  errorbells = false,
  expandtab = true,
  fileencoding = 'utf-8',
  fileformat = 'unix',
  formatoptions = 'cqrnj',
  fillchars = 'vert:|',
  foldclose = 'all',
  foldcolumn = '1',
  foldenable = false,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevelstart = 20,
  foldmarker = '{{{,}}}',
  foldmethod = 'expr',
  foldnestmax = 10,
  gdefault = true,
  guicursor = '',
  hidden = true,
  history = 100,
  hlsearch = false,
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  joinspaces = false,
  laststatus = 2,
  lazyredraw = true,
  linebreak = true,
  list = true,
  listchars = 'tab:→ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:␣',
  magic = true,
  matchtime = 0,
  mouse = 'a',
  number = true,
  pumblend = 20,
  pyxversion = 3,
  relativenumber = true,
  report = 0,
  scrolloff = 3,
  shada = "",
  shell = '/usr/local/bin/fish',
  shiftround = true,
  shiftwidth = 2,
  shortmess = 'filnxtToOFc',
  showbreak = '↪',
  showmatch = false,
  showmode = false,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  smarttab = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  ssop = 'blank,buffers,curdir,help,tabpages,winsize',
  swapfile = false,
  switchbuf = 'useopen',
  synmaxcol = 128,
  tabstop = 2,
  termguicolors = true,
  timeout = true,
  timeoutlen = 200,
  title = true,
  ttimeoutlen = 50,
  undodir = "/Users/iago/.config/nvim/undodir",
  undofile = true,
  updatetime = 300,
  wildignore = '*\\tmp\\*,*.swp,*.zip,*.exe,*.tmp,.DS_Store',
  wildmenu = true,
  wildmode = 'longest,list,full',
  wildoptions = 'pum',
  wrap = false,
  writebackup = false,
}

local global = {
  ['airline#extensions#fzf#enabled'] = 0,
  ['airline#extensions#nvimlsp#enabled'] = 1,

  cursorhold_updatetime = 1000,

  matchup_matchparen_offscreen = {
    method = 'popup',
  },

  lightline = {
    colorscheme = 'edge',
    enable = {
      statusline = 1,
      tabline = 1,
    },
    tabline = {
      left = {{'tabs'}},
    },
  },

  vimsyn_embed = 'lp',

  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  loaded_python_provider = 0,

  gruvbox_material_enable_italic = 1,
  gruvbox_material_background = 'soft',
  gruvbox_material_sign_column_background = 'default',
  gruvbox_material_diagnostic_virtual_text = 'colored',
  gruvbox_material_better_performance = 1,

  airline_powerline_fonts = 1,
  airline_theme='gruvbox',

  xcodedarkhc_match_paren_style = 1,
  xcodedarkhc_green_comments = 1,

  closetag_filetypes = 'html,xhtml,phtml,javascriptreact,typescriptreact',
  closetag_shortcut = '>',
  closetag_close_shortcut = '<leader>>',
  closetag_regions = {
    ["typescript.tsx"] = 'jsxRegion,tsxRegion',
    ["javascript.jsx"] = 'jsxRegion'
  },

  mapleader = ' ',

  -- plugins
  rainbow_conf = {
    separately = {
      vimwiki = 0,
    },
  },

  rainbow_active = 1,

  ['sneak#label'] = 1,

  vimwiki_list = {
    {path = '$HOME/.wiki', syntax = 'default', ext = '.md'},
    {path = '$HOME/.cheat', syntax = 'default', ext = '.md'}
  },

  terraform_align = 1,
  terraform_fmt_on_save = 1,

  symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    keymaps = {
      close = "<Esc>",
      goto_location = "<cr>",
      focus_location = "o",
      hover_symbol = "<c-space>",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = {},
  },

  tex_conceal="ags",

  ['prettier#exec_cmd_async'] = 1,
  ['prettier#quickfix_auto_focus'] = 0,

  fzf_buffers_jump = 1,
  fzf_preview_window = '',
  fzf_layout = { window = '10split enew' },

  netrw_cursor = 0,
  netrw_bufsettings = 'noma nomod nonu nobl nowrap ro rnu',
  netrw_banner = 0,
  netrw_altv = 1,
  netrw_altfile = 1,
  netrw_liststyle = 0,
  netrw_keepdir = 1,
  netrw_sort_by = 'name',
  netrw_sort_direction = 'normal',
  netrw_winsize = 25,

  -- floaterm_width = vim.o.columns,
  -- floaterm_height = vim.o.lines * 0.5,
  -- floaterm_title = '',
  -- floaterm_borderchars = {'', '', '', '', '', '', '', ''},
  floaterm_position = 'center',

  mix_format_on_save = 0,
  mix_format_options = '--check-equivalent',
  mix_format_silent_errors = 1,

  user_emmet_install_global = 0,
}

-- {lhs, rhs, options}
-- options: noremap = 1, silent = 2, expr = 4, nowait = 8
local maps = {
  [''] = {
    {'f', '<Plug>Sneak_f', 0},
    {'F', '<Plug>Sneak_F', 0},
    {'t', '<Plug>Sneak_t', 0},
    {'T', '<Plug>Sneak_T', 0},
  },

  n = {
    {'<left>', '<nop>', 1},
    {'<right>', '<nop>', 1},
    {'<up>', '<nop>', 1},
    {'<down>', '<nop>', 1},

    {'<tab>', 'gt', 1},
    {'<leader>cs', ':set cursorline!<cr>', 1},

    {'j', 'gj', 1},
    {'k', 'gk', 1},

    -- {'<leader>ev', ':e $MYVIMRC<cr>', true, false},
    {'<leader>ev', ':e $MYVIMRC<cr>', 1},
    {'<leader>[', '<<', 1},
    {'<leader>]', '>>', 1},

    {'<C-h>', '<C-w>h', 1},
    {'<C-j>', '<C-w>j', 1},
    {'<C-k>', '<C-w>k', 1},
    {'<C-l>', '<C-w>l', 1},

    {'<leader><C-]>', '<C-w><C-]><C-w>T', 3},
    {'<F5>', ':FloatermToggle<CR>', 1},

    {'<leader>h', ':diffget 1<CR>', 1},
    {'<leader>l', ':diffget 2<CR>', 1},

    -- plugins
    {'<leader>u', ':UndotreeShow<CR>', 1},
    {'ga', '<Plug>(EasyAlign)', 0},

    -- {'<leader>k', ':Dirvish<CR>', true, true},
    {'<leader>k', ':Explore<CR>', 3},

    {'<C-p>', "<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>", 1},
    {'<leader>pf', "<cmd>lua require('telescope.builtin').find_files({prompt_position = 'top'})<CR>", 1},

    {'<leader>ws', '<Plug>VimwikiSplitLink', 0},
    {'<leader>wv', '<Plug>VimwikiVSplitLink', 0},

    {'<leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>", 1},
  },

  i = {
    {'<left>', '<nop>', 1},
    {'<right>', '<nop>', 1},
    {'<up>', '<nop>', 1},
    {'<down>', '<nop>', 1},

    {'<F5>', '<Esc>:FloatermToggle<CR>', 1},

    -- fzf
    {'<c-x><c-k>', '<plug>(fzf-complete-word)', 1},
    {'<c-x><c-f>', '<plug>(fzf-complete-path)', 1},
    {'<c-x><c-j>', '<plug>(fzf-complete-file-ag)', 1},
    {'<c-x><c-l>', '<plug>(fzf-complete-line)', 1},
  },

  v = {
    {'>', '>gv', 1},
    {'<', '<gv', 1},
    {'<leader>[', '<gv', 1},
    {'<leader>]', '>gv', 1},
    {'<leader>su', ':call SortByLineLength()<CR>', 1},
  },

  o = {
    {'<leader><tab>', '<plug>(fzf-maps-o)', 1},
  },

  x = {
    {'ga', '<Plug>(EasyAlign)', 0},
    {'<leader><tab>', '<plug>(fzf-maps-x)', 1},
  },

  t = {
    {'<F5>', '<C-\\><C-n>:FloatermToggle<CR>', 1},
    {'<M-h>', '<C-\\><C-n><C-w>h', 1},
    {'<M-j>', '<C-\\><C-n><C-w>j', 1},
    {'<M-k>', '<C-\\><C-n><C-w>k', 1},
    {'<M-l>', '<C-\\><C-n><C-w>l', 1},
  },
}

return {
  options = options,
  global = global,
  maps = maps,
}
