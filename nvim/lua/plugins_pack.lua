require "paq" {
  "savq/paq-nvim";

  "lewis6991/impatient.nvim";

  {'nvim-treesitter/nvim-treesitter', run = function ()
    vim.cmd(":TSUpdate")
    require('plugins.treesitter')
  end};

  'nvim-treesitter/playground';
  'nvim-treesitter/completion-treesitter';
  'nvim-treesitter/nvim-treesitter-refactor';
  'nvim-treesitter/nvim-treesitter-textobjects';

  "rebelot/kanagawa.nvim";

  "nvim-lua/plenary.nvim";
  "nvim-lua/popup.nvim";
  {'nvim-telescope/telescope.nvim', run = function ()
    require('plugins.telescope')
  end};

  'nvim-telescope/telescope-fzy-native.nvim';

  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';

  {'hrsh7th/nvim-cmp', run = function()
    require('plugins.nvim_cmp')
  end};

  'hrsh7th/vim-vsnip';

  {'lewis6991/gitsigns.nvim', run = function()
    require('gitsigns').setup()
  end};

  {'windwp/nvim-autopairs', run = function()
    require('nvim-autopairs').setup()
  end};

  'kevinhwang91/nvim-bqf';

  {'NTBBloodbath/galaxyline.nvim', run = function()
    require('plugins.galaxyline')
  end};

  {'neovim/nvim-lspconfig', run = function ()
    require('plugins.nvim-lspconfig')
  end};

  'simrat39/symbols-outline.nvim';

  'tami5/lspsaga.nvim';

  'puremourning/vimspector';
  'szw/vim-maximizer';

  {'mbbill/undotree', run = function ()
    require('plugins.undotree')
  end};

  {'dracula/vim', as = 'dracula'};
  {'gruvbox-community/gruvbox', opt = true};
  {'glepnir/zephyr-nvim'};
  {'sainnhe/gruvbox-material', opt = true};
  'folke/tokyonight.nvim';
  'folke/lsp-colors.nvim';
  'arcticicestudio/nord-vim';

  'windwp/nvim-ts-autotag';

  {"blackCauldron7/surround.nvim", run = function()
    require "surround".setup {}
  end};

  'rust-lang/rust.vim';
  'simrat39/rust-tools.nvim';
  'hashivim/vim-terraform';
  'bakpakin/fennel.vim';

  {'vimwiki/vimwiki', run = function ()
    require('plugins.vimwiki')
  end};

  'editorconfig/editorconfig-vim';


  'tpope/vim-dispatch';
  'junegunn/gv.vim';
  'kyazdani42/nvim-web-devicons';

  'elixir-editors/vim-elixir';

  'jose-elias-alvarez/null-ls.nvim';
  'jose-elias-alvarez/nvim-lsp-ts-utils';

  'MunifTanjim/prettier.nvim';

  'b3nj5m1n/kommentary';
  {'phaazon/hop.nvim', run = function ()
    require('plugins.hop')
  end};

  'kshenoy/vim-signature';
  'junegunn/goyo.vim';
  'junegunn/limelight.vim';
  'tpope/vim-fugitive';
  'lervag/vimtex';
  'lambdalisue/nerdfont.vim';

  'antoinemadec/FixCursorHold.nvim';
}

vim.cmd([[
  colorscheme kanagawa
]])