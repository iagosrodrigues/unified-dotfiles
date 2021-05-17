_O = {}

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

local config = require'config'

local global = config.global
local maps = config.maps

global.coc = false

-- Some settings are not set in current window, reflecting only on new windows
vim.wo.cursorline = true
vim.o.cursorline = true
vim.wo.list = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true

for key, value in pairs(config.options) do
  vim.o[key] = value
end

function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function extend_config(config)
  global = vim.tbl_extend("force", global, config.global)
  for k, v in ipairs({'', 'n', 'i', 'v', 'o', 'x', 't'}) do
    vim.list_extend(maps[v], config.maps[v] or {})
  end
end

if global.coc then
  extend_config(require'coc')
else
  extend_config(require'nvimlsp')
end

for k, v in pairs(global) do
  vim.g[k] = v
end

for mode, mappings in pairs(maps) do
  for key, value in pairs(mappings) do
    local lhs = value[1]
    local rhs = value[2]

    local check_bit = function(bit)
      return vim.fn['and'](value[3], bit) > 0
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

require'plugins'
require'treesitter'

vim.api.nvim_exec([[
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

" augroup dirvish_config
"   autocmd!
"
"   autocmd FileType dirvish nnoremap <silent><buffer> % :execute('e ' . expand('%') . input('Enter filename: '))<CR>
"   autocmd FileType dirvish nnoremap <silent><buffer><nowait> d :call mkdir(expand('%') . input('Enter directory: '), 'p') <bar> :e<CR>
" augroup END

" vim-matchup
highlight MatchWord cterm=italic gui=italic
highlight MatchWordCur cterm=italic gui=italic
]], false)

vim.env.FZF_DEFAULT_COMMAND = 'fd'
vim.env.SKIM_DEFAULT_COMMAND = 'fd'

local noamcore_bg_transparent = vim.fn.has('mac') == 0 and true or false
local noamcore_wayland = false

if vim.fn.has('mac') == 1 then
  vim.g.python3_host_prog = '/usr/local/bin/python3'
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end

if vim.fn.executable('tmux') and vim.env.TMUX ~= '' then
  vim.g.tmux = 1
else
  vim.g.tmux = 0
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

-- Need to be here
if not global.coc then
  require'lsp'
end
