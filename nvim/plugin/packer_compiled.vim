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
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
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
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/iago/.local/share/nvim/site/pack/packer/opt/vim-terraform"
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
  }
}

time("Defining packer_plugins", false)

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
