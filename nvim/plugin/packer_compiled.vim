" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/iago/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/iago/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/iago/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/iago/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/iago/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["alchemist.vim"] = {
    after_files = { "/Users/iago/.local/share/nvim/site/pack/packer/opt/alchemist.vim/after/plugin/alchemist.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/alchemist.vim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["fennel.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/fennel.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14statusbar\frequire\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nù\r\0\0\6\0001\0q6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\r\0'\3\n\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\31\0'\4 \0005\5!\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\"\0'\4#\0005\5$\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3%\0'\4&\0005\5'\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3(\0'\4)\0005\5*\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3+\0'\4,\0005\5-\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2.\0'\3+\0'\4/\0005\0050\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2J<c-\\><c-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>\6t\1\0\2\vsilent\2\fnoremap\2C<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>\n<A-d>\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>\a]e\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>\a[e\1\0\2\vsilent\2\fnoremap\2G<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>\15<leader>cd\1\0\2\vsilent\2\fnoremap\2B<cmd>lua require('lspsaga.provider').preview_definition()<CR>\agd\1\0\2\vsilent\2\fnoremap\0024<cmd>lua require('lspsaga.rename').rename()<CR>\t<F2>\1\0\2\vsilent\2\fnoremap\2C<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>\ags\1\0\2\vsilent\2\fnoremap\2F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>\n<c-b>\1\0\2\vsilent\2\fnoremap\2E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>\n<c-f>\1\0\2\vsilent\2\fnoremap\2=<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>\6K\1\0\2\vsilent\2\fnoremap\2D:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>\6v\1\0\2\vsilent\2\fnoremap\2=<cmd>lua require('lspsaga.codeaction').code_action()<CR>\15<leader>ca\6n\20nvim_set_keymap\bapi\bvim\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hardtime"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-hardtime"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/vim-terraform"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimspector = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme zephyr\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\nù\r\0\0\6\0001\0q6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\r\0'\3\n\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\31\0'\4 \0005\5!\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\"\0'\4#\0005\5$\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3%\0'\4&\0005\5'\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3(\0'\4)\0005\5*\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3+\0'\4,\0005\5-\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2.\0'\3+\0'\4/\0005\0050\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2J<c-\\><c-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>\6t\1\0\2\vsilent\2\fnoremap\2C<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>\n<A-d>\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>\a]e\1\0\2\vsilent\2\fnoremap\2J<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>\a[e\1\0\2\vsilent\2\fnoremap\2G<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>\15<leader>cd\1\0\2\vsilent\2\fnoremap\2B<cmd>lua require('lspsaga.provider').preview_definition()<CR>\agd\1\0\2\vsilent\2\fnoremap\0024<cmd>lua require('lspsaga.rename').rename()<CR>\t<F2>\1\0\2\vsilent\2\fnoremap\2C<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>\ags\1\0\2\vsilent\2\fnoremap\2F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>\n<c-b>\1\0\2\vsilent\2\fnoremap\2E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>\n<c-f>\1\0\2\vsilent\2\fnoremap\2=<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>\6K\1\0\2\vsilent\2\fnoremap\2D:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>\6v\1\0\2\vsilent\2\fnoremap\2=<cmd>lua require('lspsaga.codeaction').code_action()<CR>\15<leader>ca\6n\20nvim_set_keymap\bapi\bvim\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14statusbar\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: zephyr-nvim
time("Config for zephyr-nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme zephyr\bcmd\bvim\0", "config", "zephyr-nvim")
time("Config for zephyr-nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: surround.nvim
time("Config for surround.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time("Config for surround.nvim", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'fennel.vim'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'alchemist.vim'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType terraform ++once lua require("packer.load")({'vim-terraform'}, { ft = "terraform" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/terraform.vim", true)
vim.cmd [[source /Users/iago/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/terraform.vim]]
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/terraform.vim", false)
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/fennel.vim/ftdetect/fennel.vim", true)
vim.cmd [[source /Users/iago/.local/share/nvim/site/pack/packer/opt/fennel.vim/ftdetect/fennel.vim]]
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/fennel.vim/ftdetect/fennel.vim", false)
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", true)
vim.cmd [[source /Users/iago/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time("Sourcing ftdetect script at: /Users/iago/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
