let plugspath = $VIM.'/autoload'
let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

" Plug '~/Projects/vim-zettel-noam', { 'for': 'vimwiki' }

" Themes
Plug 'arzg/vim-colors-xcode'

" Languages
Plug 'arzg/vim-rust-syntax-ext', { 'for': 'rust' }
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for' : 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" Plug 'pangloss/vim-javascript'

" Extensions
" Plug 'neovim/nvim-lsp' " Requires v0.5
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'dhruvasagar/vim-zoom' " Zoom like tmux
Plug 'heavenshell/vim-jsdoc'
" Plug 'alok/notational-fzf-vim'

Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }

" Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
" if has("mac")
"   Plug '/usr/local/opt/fzf'
" elseif has("linux")
"   Plug '/usr/bin/fzf'
" endif
" Plug 'junegunn/fzf.vim'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'kshenoy/vim-signature' " Gerenciar marcações com o m
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim', { 'for': 'html' } " Escrever HTML como seletores CSS
Plug 'ehamberg/vim-cute-python', { 'for': 'py' }
Plug 'junegunn/vim-easy-align' " Plugin para alinhamento
" Plug 'jiangmiao/auto-pairs'
" Plug 'alvan/vim-closetag'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

call plug#end()
