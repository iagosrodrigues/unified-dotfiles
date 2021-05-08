let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

Plug 'takac/vim-hardtime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

if g:coc
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
else
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'simrat39/symbols-outline.nvim'
endif

" Debugger
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }
"
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'

" Themes
" Plug 'chriskempson/base16-vim'
" Plug 'gruvbox-community/gruvbox'
" Plug 'ntk148v/vim-horizon'
" Plug 'axvr/photon.vim'
" Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Plug 'arzg/vim-colors-xcode'
" Plug 'arzg/vim-rust-syntax-ext'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/edge'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }

" Extensions
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/gv.vim'
" Plug 'sbdchd/neoformat'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }
" Plug 'luochen1990/rainbow'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
" Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
" Plug 'lotabout/skim.vim'
Plug 'kshenoy/vim-signature' " Gerenciar marcações com o m
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'itchyny/lightline.vim'
" Plug 'justinmk/vim-dirvish'
" Plug 'kyazdani42/nvim-web-devicons' " lua
" Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'lambdalisue/nerdfont.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'alvan/vim-closetag'

" Experiments
Plug 'andymass/vim-matchup'
" Plug 'delphinus/vim-auto-cursorline'

call plug#end()
