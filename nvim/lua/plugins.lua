vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'takac/vim-hardtime'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/completion-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'simrat39/symbols-outline.nvim'

  -- Debugger
  use 'puremourning/vimspector'
  use 'szw/vim-maximizer'

  use 'voldikss/vim-floaterm'
  use 'mbbill/undotree'

  -- Colorschemes
  use 'sainnhe/gruvbox-material'

  -- Programming languages
  use 'rust-lang/rust.vim'
  use {'slashmili/alchemist.vim', ft = {'elixir'} }
  use {'hashivim/vim-terraform', ft = {'terraform'} }
  use {'bakpakin/fennel.vim', ft = {'fennel'} }

  use 'vimwiki/vimwiki'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-dispatch'
  use 'junegunn/gv.vim'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'justinmk/vim-sneak'
  use 'kshenoy/vim-signature'
  use {'junegunn/goyo.vim', cmd = 'Goyo' }
  use 'junegunn/limelight.vim'
  use 'tpope/vim-fugitive'
  use {'lervag/vimtex', ft = {'tex'} }
  use 'lambdalisue/nerdfont.vim'

  use 'andymass/vim-matchup'
  use 'antoinemadec/FixCursorHold.nvim'
end)
