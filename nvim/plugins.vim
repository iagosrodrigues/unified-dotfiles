let plugspath = $VIM.'/autoload'
let plugspath = '~/.local/share/nvim/plugged'

if empty(glob(plugspath))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugspath)

" Themes
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'Yggdroot/indentLine' " Indent level bars

" Extensions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'

Plug 'slashmili/alchemist.vim', { 'for': ['elixir'] }
Plug 'mhinz/vim-mix-format', { 'for': ['elixir'] }

Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'hail2u/vim-css3-syntax', { 'for' : 'css' }

Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'vim-scripts/fountain.vim', { 'for': 'fountain' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
if has("mac")
  Plug '/usr/local/opt/fzf'
elseif has("linux")
  Plug '/usr/bin/fzf'
endif
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature' " Gerenciar marcações com o m
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'majutsushi/tagbar'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'json'] }
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim', { 'for': 'html' } " Escrever HTML como seletores CSS
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'ehamberg/vim-cute-python', { 'for': 'py' }
Plug 'junegunn/vim-easy-align' " Plugin para alinhamento
Plug 'tricktux/pomodoro.vim'
" Plug 'voldikss/vim-floaterm'
" Plug 'psliwka/vim-smoothie'

" Disabled"
" Plug 'wellle/targets.vim'
" Plug 'Shougo/vimproc', {'do': 'make'}
" Plug 'benmills/vimux' " Integração com TMUX para Vim
" Plug 'tpope/vim-sleuth' " Detecta o estilo de indentação
" Plug 'vim-scripts/matchit.zip' " Melhora na correspondencia do %
" Plug 'tpope/vim-endwise' " Automaticamente adiciona endif e etc para Ruby e Vimscript
" Plug 'tpope/vim-fugitive'

call plug#end()
