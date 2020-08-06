let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }
"
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Themes
Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'neovim/nvim-lsp'

Plug 'Olical/aniseed', { 'tag': 'v3.6.0' }
Plug 'bakpakin/fennel.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" Extensions
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
" Plug 'dhruvasagar/vim-zoom' " Zoom like tmux
" Plug 'heavenshell/vim-jsdoc'

Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }
" Plug 'ryanoasis/vim-devicons'
" Plug 'luochen1990/rainbow'
Plug 'ehamberg/vim-cute-python', { 'for': 'py' }
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'kshenoy/vim-signature' " Gerenciar marcações com o m
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'mattn/emmet-vim', { 'for': 'html' } " Escrever HTML como seletores CSS
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }

call plug#end()
