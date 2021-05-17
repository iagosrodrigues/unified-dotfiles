vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {'nvim-telescope/telescope.nvim', requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-lua/popup.nvim'}
      }
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
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
      'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function()
        require'statusbar'
      end
    }

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/completion-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'simrat39/symbols-outline.nvim'
    use {'glepnir/lspsaga.nvim', config = function ()
      local remap = vim.api.nvim_set_keymap
      require'lspsaga'.init_lsp_saga({
        code_action_prompt = {
          enable = false
        }
      })

      remap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})
      remap('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", {noremap = true, silent = true})
      remap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {noremap = true, silent = true})
      remap('n', '<c-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
      remap('n', '<c-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})
      remap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})
      remap('n', '<F2>', "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
      remap('n', 'gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", {noremap = true, silent = true})
      remap('n', '<leader>cd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", {noremap = true, silent = true})
      remap('n', '[e', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})
      remap('n', ']e', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
      remap('n', '<M-d>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", {noremap = true, silent = true})
      remap('t', '<M-d>', "<c-\\><c-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>", {noremap = true, silent = true})
    end}

    use 'takac/vim-hardtime'

    -- Debugger
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    use 'voldikss/vim-floaterm'
    use 'mbbill/undotree'

    -- Colorschemes
    -- use 'sainnhe/gruvbox-material'
    -- use { 'tjdevries/gruvbuddy.nvim', requires = {{'tjdevries/colorbuddy.vim'}} }
    -- use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'glepnir/zephyr-nvim', config = function ()
      vim.cmd[[colorscheme zephyr]]
    end}
    -- use {'folke/tokyonight.nvim', opt = true, config = function ()
    --   vim.cmd[[colorscheme tokyonight]]
    -- end}
    use 'folke/lsp-colors.nvim'
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
    -- use {'slashmili/alchemist.vim', ft = {'elixir'} }
    use {'hashivim/vim-terraform', ft = {'terraform'} }
    use {'bakpakin/fennel.vim', ft = {'fennel'} }

    use {'vimwiki/vimwiki', ft = {'markdown'}}
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-dispatch'
    use 'junegunn/gv.vim'
    use 'kyazdani42/nvim-web-devicons'

    use {'elixir-editors/vim-elixir', ft = {'elixir'}}

    use 'tpope/vim-commentary'
    use 'justinmk/vim-sneak'
    use 'kshenoy/vim-signature'
    use {'junegunn/goyo.vim', cmd = 'Goyo' }
    use 'junegunn/limelight.vim'
    use 'tpope/vim-fugitive'
    use {'lervag/vimtex', ft = {'tex'} }
    use 'lambdalisue/nerdfont.vim'

    use {'andymass/vim-matchup', config = function()
      vim.cmd[[
        highlight MatchWord cterm=italic gui=italic
        highlight MatchWordCur cterm=italic gui=italic
      ]]
    end}
    use 'antoinemadec/FixCursorHold.nvim'

    -- Firulas
    use {'p00f/nvim-ts-rainbow', opt = true}

    vim.cmd([[
      packadd nvim-ts-rainbow
    ]])
  end
)
