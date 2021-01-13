echo "PLUGINS"
let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'nvim-lua/plenary.nvim'

if g:coc
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
else
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'tjdevries/nlua.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  " Plenty lua scripts
  Plug 'tjdevries/express_line.nvim'
  Plug 'nvim-lua/lsp_extensions.nvim'
endif

" Debugger
Plug 'puremourning/vimspector'

" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }
"
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'

" Themes
" Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'axvr/photon.vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'dracula/vim', { 'as': 'dracula' }

" Languages
Plug 'rust-lang/rust.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }

" Extensions
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-dispatch'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }
" Plug 'luochen1990/rainbow'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'kshenoy/vim-signature' " Gerenciar marcações com o m
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'justinmk/vim-dirvish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'alvan/vim-closetag'

call plug#end()
