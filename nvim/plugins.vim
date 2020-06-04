let plugspath = $VIM.'/autoload'
let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

if !g:pure
  Plug 'ryanoasis/vim-devicons'
  Plug 'luochen1990/rainbow'
  Plug 'ehamberg/vim-cute-python', { 'for': 'py' }
  Plug 'majutsushi/tagbar'
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
endif

Plug 'itchyny/lightline.vim'
" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }
"
Plug 'voldikss/vim-floaterm'

" Themes
Plug 'arzg/vim-colors-xcode'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'arzg/vim-rust-syntax-ext', { 'for': 'rust' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for' : 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" Extensions
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'dhruvasagar/vim-zoom' " Zoom like tmux
Plug 'heavenshell/vim-jsdoc'
" Plug 'alok/notational-fzf-vim'

Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }

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
Plug 'junegunn/vim-easy-align' " Plugin para alinhamento
Plug 'tpope/vim-fugitive'

call plug#end()
