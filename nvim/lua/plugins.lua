-- Install lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  -- Themes
  { "rose-pine/neovim",     name = "rose-pine" },
  { "folke/tokyonight.nvim" },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      transparent = false,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            }
          }
        }
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          Float = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          NormalFloat = { bg = "none" },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- LazyNormal = { fg = theme.ui.bg_m3, bg = theme.ui.fg_dim },
          -- MasonNormal = { fg = theme.ui.bg_m3, bg = theme.ui.fg_dim },

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },

          NotifyBackground = { bg = theme.ui.bg_m1 },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          LspInlayHint = { fg = "#7f7f7f", bg = "none" },
        }
      end,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      }
    }
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = "#00000000",
    },
    config = function()
      vim.notify = require('notify')
    end
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require('barbecue').setup({
        create_autocmd = false
      })
      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end
  },

  -- Utilities
  "tpope/vim-sleuth",          -- Detect tabstop and shiftwidth automatically
  "nvim-lualine/lualine.nvim", -- Statusline
  --[[ {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
    end,
  }, ]]
  "JoosepAlviste/nvim-ts-context-commentstring",
  -- "nvim-tree/nvim-tree.lua",

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end,
  },

  -- Autocompletion
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            dismiss = "<C-e>",
            accept = "<C-y>",
            next = "<C-j>",
            prev = "<C-k>",
          },
        },
      }
    end,
  },

  --[[ {
    "zbirenbaum/copilot-cmp",
    after = "copilot.lua",
  }, ]]

  -- Git related plugins
  "dinhhuy258/git.nvim", -- For git blame & browse,
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "lewis6991/gitsigns.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
  },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/completion-treesitter" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },

  -- LSP Support
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup {
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
              }
            }
          }
        end
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('mason-lspconfig').setup {
            automatic_installation = true,
          }

          require('mason-lspconfig').setup_handlers {
            function(server_name)
              require('lspconfig')[server_name].setup {}
            end,
          }
        end
      },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      { "j-hui/fidget.nvim" },
      { "nvim-lua/lsp-status.nvim" },
    }
  },

  { "laytan/cloak.nvim" },
  --[[ {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Status updates for LSP
      "j-hui/fidget.nvim",
      "nvim-lua/lsp-status.nvim",
    },
  },
  "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua ]]

  -- Autocompletion
  --[[ {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  }, ]]

  -- Misc
  "ThePrimeagen/harpoon",
  "Tastyep/structlog.nvim",
  "b3nj5m1n/kommentary",
  "nvim-lua/popup.nvim",
  "onsails/lspkind-nvim", -- vscode-like pictograms
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },                       -- LSP UIs
  "kevinhwang91/nvim-bqf", -- Better quickfix window in Neovim, polish old quickfix window
  "echasnovski/mini.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "folke/zen-mode.nvim",
  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- Language
  { "rust-lang/rust.vim",                     ft = { "rust" } },
  { "elixir-editors/vim-elixir",              ft = { "elixir" } },
  { "hashivim/vim-terraform",                 ft = { "terraform" } },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "BufWinEnter",
    config = true
  },
  "b0o/schemastore.nvim",
  "MunifTanjim/prettier.nvim", -- Prettier plugin for Neovim's built-in LSP client
  --   'norcalli/nvim-colorizer.lua',
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      local hop = require "hop"
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, hint_offset = -1 }
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, hint_offset = 1 }
      end, { remap = true })
    end,
  },
  --[[ {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }, ]]
  'monkoose/matchparen.nvim',
  "tpope/vim-dispatch",
  "junegunn/gv.vim",
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        dimming = {
          alpha = 0.25,                    -- amount of dimming
          color = { "Normal", "#000000" }, -- can be a hex color, or a highlight group, or a list of either
          inactive = true,                 -- also dim inactive windows
        },
      }
    end,
  },
  -- "akinsho/bufferline.nvim",
  -- { "RRethy/vim-illuminate" },
  { "mbbill/undotree",         cmd = "UndotreeToggle" },
  { "simrat39/rust-tools.nvim" },
  "editorconfig/editorconfig-vim",
  "antoinemadec/FixCursorHold.nvim",
  "rafamadriz/friendly-snippets",
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = true,
      }
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  }
}
