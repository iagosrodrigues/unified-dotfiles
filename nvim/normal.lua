vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

options = {
  -- string
  shada = "",
  mouse = 'a',
  guicursor = '',
  foldclose = all,
  foldcolumn = '3',
  signcolumn = yes,
  showbreak = '↪',
  fileformat = unix,
  wildoptions = pum,
  foldmethod = expr,
  bufhidden = unload,
  switchbuf = useopen,
  inccommand = nosplit,
  fileencoding = 'utf-8',
  foldmarker = '{{{,}}}',
  clipboard = unnamedplus,
  shell = '/usr/local/bin/fish',
  wildmode = 'longest,list,full',
  backspace = 'indent,eol,start',
  shortmess = 'filnxtToOFc',
  undodir = '~/.config/nvim/undodir',
  foldexpr = 'nvim_treesitter#foldexpr()',
  fillchars = 'vert:|',
  completeopt = 'menuone,noinsert,noselect',
  diffopt = 'internal,filler,closeoff,context:4,vertical',
  ssop = 'blank,buffers,curdir,help,tabpages,winsize',
  wildignore = '*\\tmp\\*,*.swp,*.zip,*.exe,*.tmp,.DS_Store',
  listchars = 'tab:→ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:␣',

  -- integer
  report = 0,
  tabstop = 2,
  cmdheight = 2,
  history = 100,
  pumblend = 20,
  matchtime = 0,
  scrolloff = 3,
  laststatus = 2,
  pyxversion = 3,
  shiftwidth = 2,
  synmaxcol = 128,
  softtabstop = 2,
  conceallevel = 2,
  updatetime = 300,
  foldnestmax = 10,
  ttimeoutlen = 50,
  timeoutlen = 200,
  foldlevelstart = 20,

  -- boolean
  title = true,
  wrap = false,
  magic = true,
  list = false,
  number = true,
  hidden = true,
  timeout = true,
  backup = false,
  smarttab = true,
  wildmenu = true,
  gdefault = true,
  autoread = true,
  undofile = true,
  expandtab = true,
  linebreak = true,
  swapfile = false,
  incsearch = true,
  smartcase = true,
  showmode = false,
  hlsearch = false,
  copyindent = true,
  autoindent = true,
  shiftround = true,
  ignorecase = true,
  cursorline = true,
  lazyredraw = true,
  splitbelow = true,
  splitright = true,
  showmatch = false,
  compatible = false,
  breakindent = true,
  foldenable = false,
  smartindent = true,
  errorbells = false,
  joinspaces = false,
  writebackup = false,
  equalalways = false,
  termguicolors = true,
  relativenumber = true,
}

for key, value in pairs(options) do
  vim.o[key] = value
end

global = {
  ['airline#extensions#fzf#enabled'] = 0,

  vimsyn_embed = 'lp',

  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  loaded_python_provider = 0,

  gruvbox_italic = 1,
  gruvbox_invert_selection = '0',
  gruvbox_contrast_dark = "medium",

  fzf_buffers_jump = 1,
  fzf_preview_window = '',

  rainbow_conf = {
    separately = {
      vimwiki =  0
    }
  },

  airline_powerline_fonts = 1,
  airline_theme='gruvbox',

  xcodedark_match_paren_style = 1,

  closetag_filetypes = 'html,xhtml,phtml,javascriptreact,typescriptreact',
  closetag_shortcut = '>',
  closetag_close_shortcut = '<leader>>',
  closetag_regions = {
    ["typescript.tsx"] = 'jsxRegion,tsxRegion',
    ["javascript.jsx"] = 'jsxRegion'
  },

  coc = 1,
  coc_global_extensions = {
    'coc-rust-analyzer',
    'coc-pairs',
    'coc-tsserver',
    'coc-eslint',
    'coc-prettier',
    'coc-json',
  },
  coc_snippet_next = '<tab>',

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

  tex_conceal="ags",

  ['prettier#exec_cmd_async'] = 1,
  ['prettier#quickfix_auto_focus'] = 0,

  fzf_buffers_jump = 1,
  fzf_preview_window = '',
  fzf_layout = { window = '10split enew' },
  fzf_buffers_jump = 1,

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

  floaterm_width = vim.o.columns,
  floaterm_height = vim.o.lines * 0.5,
  floaterm_title = '',
  floaterm_borderchars = {'', '', '', '', '', '', '', ''},
  floaterm_position = 'bottom',

  mix_format_on_save = 0,
  mix_format_options = '--check-equivalent',
  mix_format_silent_errors = 1,

  user_emmet_install_global = 0,

  -- lspconfig
  completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'},
  diagnostic_enable_virtual_text = 1,
  diagnostic_virtual_text_prefix = ' ',
  diagnostic_trimmed_virtual_text = '40',
  diagnostic_insert_delay = 1,
}


for k, v in pairs(global) do
  vim.g[k] = v
end

function check_back_space()
  local col = vim.fn.col('.') - 1

  return not col or vim.regex('\\s'):match_str(vim.fn.getline('.'):sub(col, col))
end

vim.api.nvim_exec([[
source ~/.config/nvim/plugins.vim

colorscheme gruvbox

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight Comment cterm=italic gui=italic

highlight Sneak guifg=black guibg=orange

command! -nargs=* Make make <args> | cwindow 3

command! ConfigGinit tab drop ~/.config/nvim/ginit.vim
command! ConfigInit tab drop ~/.config/nvim/init.vim
command! ConfigPlugins tab drop ~/.config/nvim/plugins.vim
command! ConfigFnl tab drop ~/.config/nvim/fnl/dotfiles/init.fnl

command! -nargs=0 MixTest execute "!mix test %:" . line(".")

command! -nargs=0 GG :cd ~/Projects
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

function! Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! ElixirFormat() abort
    !mix format %
    e!
endfunction

function! Cmp(first, second)
    return strlen(a:first) - strlen(a:second)
endfunction

function! SortByLineLength() range abort
    let content = getline(a:firstline, a:lastline)
    call setline(a:firstline, sort(content, "Cmp"))
endfunction

function! LightlineReload(colorscheme)
    if a:colorscheme
        let g:lightline.colorscheme = a:colorscheme
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

augroup Trailing
    autocmd!

    " Automatically deletes all trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

augroup Config
    autocmd!

    autocmd BufWritePost init.vim,plugins.vim,ginit.vim,normal.vim ++nested source %

    " Disables automatic commenting on newline
    " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " autocmd VimResized * exe 'normal! \<c-w>='
    autocmd FileType vim setlocal fen fdm=marker

    autocmd FileType skim tnoremap <buffer> <esc> <c-g>

    " autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

    if !has('nvim-0.5') " Fix terminal bug glitch on every keypress
        autocmd TermEnter * setlocal scrolloff=0
        autocmd TermLeave * setlocal scrolloff=3
    endif

    autocmd FocusLost * silent! wa

    " Goyo
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

augroup Term
    autocmd!
    autocmd TermOpen * setlocal nonu nornu signcolumn=no
    autocmd TermOpen * startinsert
augroup END
]], false)

maps = {
  -- map
  [''] = {
    -- {lhs, rhs, nnoremap, silent}

    {'f', '<Plug>Sneak_f', false, false},
    {'F', '<Plug>Sneak_F', false, false},
    {'t', '<Plug>Sneak_t', false, false},
    {'T', '<Plug>Sneak_T', false, false},
  },

  n = {
    -- {lhs, rhs, nnoremap, silent}

    {'<left>', '<nop>', true, false},
    {'<right>', '<nop>', true, false},
    {'<up>', '<nop>', true, false},
    {'<down>', '<nop>', true, false},

    {'<tab>', 'gt', true, false},
    {'<leader>cs', ':set cursorline!<cr>', true, false},

    {'j', 'gj', true, false},
    {'k', 'gk', true, false},

    {'<leader>ev', ':e $MYVIMRC<cr>', true, false},
    {'<leader>[', '<<', true, false},
    {'<leader>]', '>>', true, false},

    {'<C-h>', '<C-w>h', true, false},
    {'<C-j>', '<C-w>j', true, false},
    {'<C-k>', '<C-w>k', true, false},
    {'<C-l>', '<C-w>l', true, false},

    {'<leader><C-]>', '<C-w><C-]><C-w>T', true, true},
    {'<F5>', ':FloatermToggle<CR>', true, false},

    {'<leader>h', ':diffget 1<CR>', true, false},
    {'<leader>l', ':diffget 2<CR>', true, false},

    -- plugins
    {'<leader>u', ':UndotreeShow<CR>', true, false},
    {'ga', '<Plug>(EasyAlign)', false, false},

    {'<C-p>', ':GFiles<cr>', true, false},
    {'<leader>pf', ':Files<cr>', true, false},
    {'<leader>b', ':CocList buffers<cr>', true, false},

    {'<leader>ws', '<Plug>VimwikiSplitLink', false, false},
    {'<leader>wv', '<Plug>VimwikiVSplitLink', false, false},

    -- coc
    {'K', ':call Show_documentation()<CR>', false, true},
    {'<leader>te', ':call CocAction("runCommand", "jest.singleTest")<CR>', true, false},

    {'<c-s>', '<Plug>(coc-range-select)', false, true},

    {'<leader>a', '<Plug>(coc-codeaction-selected)', false, false},
    {'<leader>ac', '<Plug>(coc-codeaction)', false, false},
    {'<leader>qf', '<Plug>(coc-fix-current)', false, false},

    {'gd', '<Plug>(coc-definition)', false, true},
    {'gy', '<Plug>(coc-type-definition)', false, true},
    {'gi', '<Plug>(coc-implementation)', false, true},
    {'gr', '<Plug>(coc-references)', false, true},

    {'<F2>', '<Plug>(coc-rename)', false, false},

    {'<leader>f', '<Plug>(coc-format)', false, false},

    {'<tab>', '<Plug>(coc-range-select)', false, true},

    -- lspconfig
    -- {'<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', true, true},
    -- {'K', '<cmd>lua vim.lsp.buf.hover()<CR>', true, true},
    -- {'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', true, true},
    -- {'<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true, true},
    -- {'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', true, true},
    -- {'gr', '<cmd>lua vim.lsp.buf.references()<CR>', true, true},
    -- {'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', true, true},
    -- {'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', true, true},
    -- {'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', true, true},
    -- {'g[', '<cmd>PrevDiagnosticCycle<CR>', true, true},
    -- {'g]', '<cmd>NextDiagnosticCycle<CR>', true, true},
    -- {'<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', true, true},
  },

  i = {
    -- {lhs, rhs, nnoremap, silent}

    {'<left>', '<nop>', true, false},
    {'<right>', '<nop>', true, false},
    {'<up>', '<nop>', true, false},
    {'<down>', '<nop>', true, false},

    {'<F5>', '<Esc>:FloatermToggle<CR>', true, false},

    -- plugins
    {'<leader>k', ':Dirvish<CR>', true, true},

    -- coc
    {'<leader>o', ':<c-u>CocList outline<CR>', false, true, false, true},
    {'<cr>', 'complete_info()["selected"] != "-1" ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', true, true, true},

    {'[c', '<Plug>(coc-diagnostic-prev)', false, false},
    {']c', '<Plug>(coc-diagnostic-next)', false, false},

    {'[g', '<Plug>(coc-git-prevchunk)', false, false},
    {']g', '<Plug>(coc-git-nextchunk)', false, false},

    {'gs', '<Plug>(coc-git-chunkinfo)', false, false},

    {'<tab>', 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<tab>" : coc#refresh()', true, true, true},
    {'<s-tab>', 'pumvisible() ? "<C-p>" : "<c-h>"', true, true, true},
    {'<c-space>', 'coc#refresh()', true, true, true},

    {'<c-x><c-k>', '<plug>(fzf-complete-word)', true, false},
    {'<c-x><c-f>', '<plug>(fzf-complete-path)', true, false},
    {'<c-x><c-j>', '<plug>(fzf-complete-file-ag)', true, false},
    {'<c-x><c-l>', '<plug>(fzf-complete-line)', true, false},

    -- lspconfig
    -- {'<tab>', 'pumvisible() ? "<C-n>" : "<tab>"', true, true, true},
    -- {'<S-tab>', 'pumvisible() ? "<C-p>" : "<S-tab>"', true, true, true},
  },

  v = {
    -- {lhs, rhs, nnoremap, silent}

    {'>', '>gv', true, false},
    {'<', '<gv', true, false},
    {'<leader>[', '<gv', true, false},
    {'<leader>]', '>gv', true, false},
    {'<leader>su', ':call SortByLineLength()<CR>', true, false},
  },

  o = {
    {'<leader><tab>', '<plug>(fzf-maps-o)', true, false},

    -- coc
    {'ig', '<Plug>(coc-git-chunk-inner)', false, false},
    {'ag', '<Plug>(coc-git-chunk-outer)', false, false},

    {'if', '<Plug>(coc-funcobj-i)', false, false},
    {'af', '<Plug>(coc-funcobj-a)', false, false},
    {'ac', '<Plug>(coc-classobj-a)', false, false},
    {'ic', '<Plug>(coc-classobj-i)', false, false},
  },

  x = {
    -- {lhs, rhs, nnoremap, silent}

    {'ga', '<Plug>(EasyAlign)', false, false},
    {'<leader><tab>', '<plug>(fzf-maps-x)', true, false},

    -- coc
    {'ig', '<Plug>(coc-git-chunk-inner)', false, false},
    {'ag', '<Plug>(coc-git-chunk-outer)', false, false},
    {'<leader>a', '<Plug>(coc-codeaction-selected)', false, false},

    {'if', '<Plug>(coc-funcobj-i)', false, false},
    {'af', '<Plug>(coc-funcobj-a)', false, false},
    {'ac', '<Plug>(coc-classobj-a)', false, false},
    {'ic', '<Plug>(coc-classobj-i)', false, false},

    {'<c-s>', '<Plug>(coc-range-select)', false, true},

    {'<leader>f', '<Plug>(coc-format-selected)', false, false},

    {'<tab>', '<Plug>(coc-range-select)', false, true},
    {'<s-tab>', '<Plug>(coc-range-select-backword)', false, true},
  },

  t = {
    -- {lhs, rhs, nnoremap, silent}

    {'<F5>', '<C-\\><C-n>:FloatermToggle<CR>', true, false},
    {'<M-h>', '<C-\\><C-n><C-w>h', true, false},
    {'<M-j>', '<C-\\><C-n><C-w>j', true, false},
    {'<M-k>', '<C-\\><C-n><C-w>k', true, false},
    {'<M-l>', '<C-\\><C-n><C-w>l', true, false},
  },
}

for mode, mappings in pairs(maps) do
  for key, value in pairs(mappings) do
    if #value < 4 then
      table.insert(value, false)
    end

    if #value < 5 then
      table.insert(value, false)
    end

    vim.api.nvim_set_keymap(
      mode,
      value[1],
      value[2],
      { noremap = value[3], silent = value[4], expr = value[5], nowait = value[6] }
    )
  end
end

vim.env.FZF_DEFAULT_COMMAND = 'fd'
vim.env.SKIM_DEFAULT_COMMAND = 'fd'

coc = 1

gold_numbers = 0

noamcore_bg_transparent = 0
noamcore_wayland = 0

if vim.fn.has('mac') then
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end

if vim.fn.executable('tmux') and vim.env.TMUX ~= '' then
  vim.g.tmux = 1
else
  vim.g.tmux = 0
end

if gold_numbers then
  vim.cmd('highlight LineNr guibg=none guifg=Gold')
  vim.cmd('highlight CursorLineNr gui=bold guifg=LightGoldenrod')
end

if noamcore_bg_transparent then
  vim.cmd('highlight Normal guibg=none')
  vim.cmd('highlight FoldColumn guibg=none')
  vim.cmd('highlight SignColumn guibg=none')
  vim.cmd('highlight EndOfBuffer guifg=bg guibg=none')
  vim.cmd('highlight CursorLineNr guibg=none')
  vim.cmd('highlight LineNr guibg=none')

  vim.cmd('highlight SpecialKey ctermbg=none gui=none ctermfg=8 guifg=8')
  vim.cmd('highlight NonText ctermbg=none gui=none ctermfg=8 guifg=8')

  vim.cmd('highlight ErrorSign guibg=#3c3836 guifg=#fb4934')
  vim.cmd('highlight WarningSign guibg=#3c3836 guifg=#fabd2f')
  vim.cmd('highlight InfoSign guibg=#3c3836 guifg=#8ec07c')
  vim.cmd('highlight Search guifg=#282a2e')
  vim.cmd('highlight DiffAdd guibg=none')
  vim.cmd('highlight DiffChange guibg=none')
  vim.cmd('highlight DiffDelete guibg=none')
  vim.cmd('highlight DiffText guibg=none')
  vim.cmd('highlight IncSearch guibg=none guifg=#282a2e')
  vim.cmd('highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold')
  vim.cmd('highlight Conceal ctermbg=NONE')
  vim.cmd('highlight Folded guifg=#838991 guibg=none')
end

function LspStatus()
  if #vim.lsp.buf_get_clients() > 0 then
    return require'lsp-status'.status()
  end
end

if not coc then
  local nvim_lsp = require'nvim_lsp'

  local on_attach = function(client)
      require'completion'.on_attach(client)
  end

  local servers = {
      'tsserver',
      'vimls',
      'rust_analyzer',
      'elixirls',
      'clangd',
      'cmake',
      'texlab',
  }

  for _, server in ipairs(servers) do
      nvim_lsp[server].setup({
          on_attach=on_attach,
      })
  end
end

local lsp_status = require'lsp-status'.status()

local coc_status = function()
    local status = vim.call('coc#status')
    local fn = vim.b['coc_current_function'] or ''

    return ' ' .. status .. ' ' .. fn
end

local generator = function(win_id)
    local el_segments = {}
    local extensions = require'el.extensions'
    local helper = require'el.helper'

    table.insert(el_segments, extensions.mode)
    table.insert(el_segments, coc_status)
    -- table.insert(el_segments, lsp_status)
    table.insert(el_segments, '%f%m%r%=%#CursorColumn# %y %{&fileencoding?&fileencoding:&encoding} [%{&fileformat}] %p%% %l:%c')

    -- table.insert(el_segments, helper.async_buf_setter(
    --     win_id,
    --     'el_git_stat',
    --     extensions.git_changes,
    --     5000
    --  ))

    return el_segments
end

require('el').setup { generator = generator }

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            }
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
            }
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@fuction.outer",
                ["if"] = "@fuction.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                ["IF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                }
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    }
}
