let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-lua/lsp-status.nvim'

" if g:coc
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" else
"   Plug 'neovim/nvim-lspconfig'
"   Plug 'nvim-lua/completion-nvim'
"   " Plug 'nvim-lua/diagnostic-nvim'
" endif

" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }
"
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'

" Plenty lua scripts
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'

" Themes
" Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'axvr/photon.vim'

" Languages
" Plug 'sheerun/vim-polyglot'
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }

" Extensions
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'

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
Plug 'justinmk/vim-dirvish'
Plug 'takac/vim-hardtime'
" Plug 'vim-airline/vim-airline'
" Plug 'alvan/vim-closetag'

call plug#end()
