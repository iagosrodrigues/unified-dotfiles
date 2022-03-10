require('plugins.explore')

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({
  function()
    use 'lewis6991/impatient.nvim'

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}

    use "rebelot/kanagawa.nvim"

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim'
      },
      config = function ()
        require('plugins.telescope')
      end
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Autocomplete
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('plugins.nvim_cmp')
      end
    }

    use 'hrsh7th/vim-vsnip'

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }
    use 'kevinhwang91/nvim-bqf'

    -- Statusbar and tabline
    -- use 'romgrk/barbar.nvim'
    use {
      'NTBBloodbath/galaxyline.nvim',
      branch = 'main',
      config = function()
        require('plugins.galaxyline')
      end
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function ()
        require('plugins.treesitter')
      end
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/completion-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function ()
        require('plugins.nvim-lspconfig')
      end
    }
    -- use 'simrat39/symbols-outline.nvim'
    use {'tami5/lspsaga.nvim', config = function ()
      require'lspsaga'.init_lsp_saga({
        code_action_prompt = {
          enable = false
        }
      })

      require('plugins.lspsaga')
    end, disable = true}

    -- Debugger
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    use {
      'mbbill/undotree',
      config = function ()
        require('plugins.undotree')
      end
    }

    -- Colorschemes
    use {'dracula/vim', as = 'dracula'}
    use {'gruvbox-community/gruvbox', opt = true}
    use {'sainnhe/gruvbox-material', opt = true}
    use {
      'folke/tokyonight.nvim',
      -- config = function ()
      --   vim.cmd[[colorscheme tokyonight]]
      -- end
    }
    use 'folke/lsp-colors.nvim'
    use 'arcticicestudio/nord-vim'
    -- use {'glepnir/indent-guides.nvim', opt = true, config = function ()
    --   require('indent_guides').setup()
    -- end}



    use 'windwp/nvim-ts-autotag'

    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require "surround".setup {}
      end
    }

    -- Programming languages
    use {'rust-lang/rust.vim', ft = {'rust'}}
    use {'simrat39/rust-tools.nvim', ft = {'rust'}}
    -- use {'slashmili/alchemist.vim', ft = {'elixir'} }
    use {'hashivim/vim-terraform', ft = {'terraform'} }
    use {'bakpakin/fennel.vim', ft = {'fennel'} }
    use {'github/copilot.vim', disable = true}

    use {
      'vimwiki/vimwiki',
      ft = {'markdown'},
      config = function ()
        require('plugins.vimwiki')
      end
    }
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-dispatch'
    use 'junegunn/gv.vim'
    use 'kyazdani42/nvim-web-devicons'

    use {'elixir-editors/vim-elixir', ft = {'elixir'}}

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    use 'MunifTanjim/prettier.nvim'
    --[[ use {
      'onsails/lspkind-nvim', config = function ()
        require('lspkind').init({
            with_text = true,

            preset = 'default',

            symbol_map = {
              Text = '?',
              Method = 'Ä',
              Function = '?',
              Constructor = '?',
              Variable = '?',
              Class = '?',
              Interface = '?',
              Module = '?',
              Property = '?',
              Unit = '?',
              Value = '?',
              Enum = '?',
              Keyword = '?',
              Snippet = '?',
              Color = '?',
              File = '?',
              Folder = '?',
              EnumMember = '?',
              Constant = '?',
              Struct = '?'
            },
        })
      end
    } ]]

    use 'b3nj5m1n/kommentary'
    use {
      'phaazon/hop.nvim',
      config = function ()
        require('plugins.hop')
      end
    }
    use 'kshenoy/vim-signature'
    use {'junegunn/goyo.vim', cmd = 'Goyo' }
    use 'junegunn/limelight.vim'
    use 'tpope/vim-fugitive'
    use {'lervag/vimtex', ft = {'tex'} }
    use 'lambdalisue/nerdfont.vim'

    use {
      'andymass/vim-matchup',
      opt = true,
      requires = {
        'nvim-treesitter/nvim-treesitter'
      },
      config = function()
        vim.cmd[[
          highlight MatchWord cterm=italic gui=italic
          highlight MatchWordCur cterm=italic gui=italic
        ]]
      end
    }
    use 'antoinemadec/FixCursorHold.nvim'

    -- Firulas
    use {'jacoborus/tender.vim', opt = true}
    use {'sainnhe/sonokai', opt = true}
    use {'lbrayner/vim-rzip'}
    use {
      'ThePrimeagen/harpoon',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim'
      },
      config = function ()
        require('harpoon')
        require('plugins.harpoon')
      end
    }

    vim.cmd([[
      " packadd nvim-ts-rainbow
      packadd vim-matchup
      colorscheme gruvbox
    ]])

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  --[[ config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
  } ]]
})
