" Configurações padrões {{{1

let s:noamcore_bg_transparent=0
let s:noamcore_wayland=0
let g:pure=0
let s:gold_numbers = 0
let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.config/nvim/plugins.vim
syntax on                 " Habilita sistema de destaques de código (highlighting)
filetype plugin indent on " Habilita carregar plugins baseados em extensão
scriptencoding utf-8      " Seleciona utf8 como codificação padrão
set path+=**
set iminsert=0
set imsearch=0
set noshowmode

" Tema {{{2

" set background=dark " Permite temas escolherem cores para um fundo mais escuro
set termguicolors
" colorscheme base16-default-dark
colorscheme xcodedark

if executable('tmux') && $TMUX !=# ''
	let g:tmux = 1
else
	let g:tmux = 0
endif

" }}}

set hidden
set nojoinspaces               " Apenas insere um único espaço depois de '.', '!' e '?'
" set report=0                   " Sempre exibir o número de linhas copiados ou apagados na linha de mensagem
set backspace=indent,eol,start " Compatibilidade com vim classico para backspace
set clipboard=unnamedplus      " O registrador * vira unnamed, permite que os textos copiados pelo vim vão para o clipboard
" set conceallevel=2             " Habilita uma especie de ligature, substitui por exemplo a palavra lambda no python pelo simbolo
set shada="NONE"
"{{{ Buffers
set switchbuf="useopen"
set bufhidden="unload"
"}}}

" Desativar 'press ENTER to continue' {{{2

set cmdheight=2  " Número de linhas para a linha de comando.
" set shortmess+=atc " Trunca quase todos os textos de comandos evitando o pressione ENTER para continuar
set shortmess+=c

" }}}

" Visual {{{2

set fillchars+=vert:\|
set number            " Mostrar os números das linhas
set relativenumber    " Mostrar os números relativos
set noequalalways
set splitbelow        " Novas janelas serão colocadas em baixo da atual se o split for horizontal
set splitright        " Novas janelas serão colocadas ao lado direito da atual se o split for vertical
set listchars=tab:»\ ,eol:⤶,trail:·,extends:❯,precedes:❮,nbsp:␣
" set listchars=tab:→\ ,eol:⤶¬,trail:·,extends:❯,precedes:❮,nbsp:␣
set updatetime=100
set signcolumn=yes
" set cursorline
set lazyredraw
" }}}

" Disable cursor shape
set guicursor=
" set guicursor=n-v-c:block
" set guicursor=n-v-c:block
"   \,a:blinkwait500-blinkoff200-blinkon5000-Cursor/lCursor
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"        \,sm:block-blinkwait175-blinkoff150-blinkon175

set nocompatible
" set completeopt+=noselect " TODO
" set completeopt-=preview " Desativa o scratch no autocomplete
set diffopt+=context:4,vertical " TODO
" set equalprg=par\ -r " Nome do programa externo que será utilizado para formatar linhas usando o operator =

" Visual {{{2

set magic      " Ativa magic para expressões regulares
set gdefault   " Pesquisa e substituição são globais por linha
set autoread   " Detecta quando um arquivo é editado
set incsearch  " Mostra enquanto digita
set smartcase  " Se a busca contiver letras maiúsculas, a pesqusa passa a ser case-sensitive
set ignorecase " As pesquisas viram case-insensitive

set nobackup   " Desabilita backups
set nowritebackup " Desativa backups
set noswapfile " Desabilita swaps
set noundofile " Desabilita arquivos de undo
set fileencoding=utf-8 " Arquivos serão no formato utf-8
set fileformat=unix " Novas linhas no formato LF apenas
" set formatprg=par\ -r " Nome do programa externo que será utilizado para formatar linhas usando o operador gc
set history=100 " Histórico contém no máximo cem comandos
set inccommand=nosplit " Mostra a substituição de texto enquanto você digita
set linebreak " Quebra simples de texto, não insere nova linha
set matchtime=0 " Quantos décimos de segundos ele demora para mostrar o parenteses correspondente
set scrolloff=3 " Número mínimo de linhas à manter acima ou abaixo do cursor
set showbreak=↪ " Mostra o caractere quando quebra a linha
"set textwidth=120 " Tamanho máximo do texto que deve ser inserido. Uma linha maior será quebrada depois do primeiro espaço em branco
set timeout
set ttimeoutlen=50
set timeoutlen=200 " Tempo em milisegundos à esperar para uma sequência mapeada para completar
set title " Permite alterar o título do terminal
set wildignore=*\\tmp\\*,*.swp,*.zip,*.exe,*.tmp,.DS_Store " Lista de padrões para ignorar no autocomplete
set wildmode=longest,list,full " Completa arquivos como um terminal
set wildmenu " Habilita o menu
" set wrapmargin=8 " Número de caracteres à borda direita onde será inserido um caracter de nova linha caso ultrapasse

" Indentação {{{

set autoindent    " Indentação automática
set smartindent   " Indentação inteligente ao iniciar uma nova linha

set shiftround    " Arredonda os tabs para um múltiplo do shiftwidth
set smarttab      " Tab respeita o 'shiftwidth'
set expandtab     " Espaço em branco no lugar de tabs

set tabstop=2     " Tamanho visível de um tab
set shiftwidth=2  " Número de espaços usados na hora da indentação. Usado nos comandos cindent, >>, <<
set softtabstop=2 " Edita como se os espaços em branco fossem tabs de tamanho de 4 caracteres

set breakindent   " Linhas quebradas continuam indentadas visualmente
set copyindent    " Copia as linhas com indentação

" }}}

" Configurações de folding {{{1

set nofoldenable       " Desabilita o folding por padrão
set foldmethod=indent  " Método padrão do fold é indentação
set foldmarker={{{,}}} " Marcadores do fold
set foldclose=all      " Permite o folding automaticamente quando não está no cursor ou o nível é maior do que o folding level
set foldlevelstart=20  " Abrir o maior fold por padrão
set foldnestmax=10     " Nível máximo de folding aninhado
" set foldcolumn=3       " Número de colunas para mostrar o folding

" }}}
" Barra de status {{{1
set laststatus=2
" set statusline=%#CursorColumn#%#LineNr#\ %f%m%r%=%#CursorColumn#\ %y\ %{&fileencoding?&fileencoding:&encoding}\[%{&fileformat}\]\ %p%%\ %l:%c
" Esquemas customatizados {{{1

highlight SpecialKey cterm=none guibg=none ctermfg=green guifg=green

" Faz tabs e outros caracteres não-texto menos chatos
highlight SpecialKey ctermbg=none gui=none ctermfg=8 guifg=8
highlight NonText ctermbg=none gui=none ctermfg=8 guifg=8

" Comentários e atributos HTML sempre em itálico
" highlight Comment cterm=italic
" highlight htmlArg cterm=italic
" highlight xmlAttrib cterm=italic

" Remover cor de fundo
if s:noamcore_bg_transparent
	highlight Normal guibg=none
	highlight FoldColumn guibg=none
	highlight Folded guifg=black guibg=none
	highlight SignColumn guibg=none
endif

if s:gold_numbers
  highlight LineNr guibg=none guifg=Gold
  highlight CursorLineNr gui=bold guifg=LightGoldenrod
endif

" highlight EndOfBuffer guifg=bg guibg=none
" highlight ErrorSign guibg=#3c3836 guifg=#fb4934
" highlight WarningSign guibg=#3c3836 guifg=#fabd2f
" highlight InfoSign guibg=#3c3836 guifg=#8ec07c
" highlight Search guifg=#282a2e
" highlight IncSearch guibg=none guifg=#282a2e
" highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold
" highlight Conceal ctermbg=NONE

" highlight clear CursorLine
" highlight CursorLine gui=underline cterm=underline

" vim-sneak
highlight Sneak guifg=black guibg=orange

" Destaca conflitos do git
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}
" Mapeamento {{{
let mapleader = "," " O padrão é \, mas é mais fácil digitar o vírgula
let g:mapleader = "," " Usado para os scripts

" Desabilitar as setinhas
noremap <left>  <nop>
noremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>
noremap <c-space>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <c-space> <nop>

" Alternar abas via tab no modo normal
nnoremap <tab> gt

" Alterna a numeração das linhas para relativo
nnoremap <leader>tn :set relativenumber!<cr>

" Alterna o modo de colar
nnoremap <leader>tp :set paste!<cr>

" Alterna o modo de indentação
nnoremap <leader>tf :set foldenable!<cr>

" Alterna entre mostrar ou não a linha onde o cursor está
nnoremap <leader>cs :set cursorline!<cr>

nnoremap <leader><tab> :w<cr>

" Mover através das linhas visíveis, não das linhas numeradas
noremap j gj
noremap k gk

" Os blocos selecionados continuam selecionados depois de indentar
vnoremap > >gv
vnoremap < <gv

" Fechar o buffer atual
nmap <silent> <space>b :bun<cr>

" Voltar para o modo normal com jw
inoremap jw <esc>
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif

" Desabilita o esc para sair do modo de inserção, forçando o uso do jk
inoremap <esc> <nop>

" Editar este arquivo
nnoremap <leader>ev :e $MYVIMRC<cr>

" Limpar pesquisas feitas
nnoremap <space> :nohlsearch<cr>

" Remover espaços em branco (trailing spaces)
nnoremap <leader><space> :%s/\s\+$<cr>

" Remover linhas extras
nnoremap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" Alternar entre exibir ou não os símbolos
nnoremap <leader>l :set list!<cr>

" Indentação estilo textmate
vnoremap <leader>[ <gv
vnoremap <leader>] >gv
nnoremap <leader>[ <<
nnoremap <leader>] >>

" Alterar entre as janelas (não tabs)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has('nvim')
	tnoremap <M-h> <C-\><C-n><C-w>h
	tnoremap <M-j> <C-\><C-n><C-w>j
	tnoremap <M-k> <C-\><C-n><C-w>k
	tnoremap <M-l> <C-\><C-n><C-w>l
endif

" Alternar entre o buffer atual e o anterior
nnoremap <leader>. <c-^>

" Abrir tags em uma nova aba
nnoremap <silent> <leader><C-]> <C-W><C-]><C-W>T

" Possibilita ordernar por comprimento da linha
vnoremap <leader>su !awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

if has('nvim')
	nnoremap <silent><M-t> :FloatermToggle<CR>
	inoremap <silent><M-t> <Esc>:FloatermToggle<CR>
	tnoremap <silent><M-t> <C-\><C-n>:FloatermToggle<CR>
	tnoremap <silent><Esc> <C-\><C-n>
endif

" {{{ Commands
"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=* Make make <args> | cwindow 3

command! ConfigGinit tab drop ~/.config/nvim/ginit.vim
command! ConfigInit tab drop ~/.config/nvim/init.vim
command! ConfigPlugins tab drop ~/.config/nvim/plugins.vim

command! -nargs=0 GG :cd ~/Projects
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <silent> <leader>o :<C-u>CocList outline<CR>
" }}}

" Plugins {{{1
" Mapeamento para plugins {{{2
" nnoremap <expr><silent> <leader>k :NERDTreeToggle<cr>
nnoremap <silent> <leader>k :Explore<CR>

" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Inicia interativamente o EasyAlign no modo visual (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Inicia interativamente o EasyAlign para um texto ou objeto movimentação (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <F8> :TagbarToggle<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info()["selected"] != "-1" ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

" }}}
" Variáveis de plugins {{{2

let $FZF_DEFAULT_COMMAND='fd'
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
" let g:ale_completion_enabled = 1
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_tsserver_autoimport = 1
let g:indentLine_char = '┊'

if s:noamcore_wayland
	let g:clipboard = {
		\ 'name': 'wl-clipboard',
		\ 'copy': {
		\   '+': 'wl-copy',
		\   '*': 'wl-copy',
		\  },
		\ 'paste': {
		\   '+': 'wl-paste -n',
		\   '*': 'wl-paste -n',
		\  },
		\ 'cache_enabled': 1,
		\ }
endif

" let g:floaterm_width = float2nr(&columns * 0.8)
" let g:floaterm_height = float2nr(&lines * 0.8)
" let g:floaterm_position = 'center'

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"
let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
  \     ],
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
  \   'subseparator': { 'left': ")", 'right': "(" },
  \   'component_function': {
  \     'gitbranch': 'FugitiveStatusline',
  \     'cocstatus': 'coc#status',
  \     'currentfunction': 'CocCurrentFunction',
  \   }
  \ }

let g:mix_format_on_save = 0
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1
let g:user_emmet_install_global = 0
let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_buffers_jump = 1

let g:rainbow_active = 1

let g:sneak#label = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list=[{'path': '$HOME/.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '$HOME/.cheat', 'syntax': 'markdown', 'ext': '.md'}]

let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 0

let g:terraform_align=1
let g:terraform_fmt_on_save=1

let g:tex_conceal="ags"
" }}}
" }}}
" Configurações automáticas baseado em eventos {{{

augroup Trailing
	autocmd!

	" Automatically deletes all trailing whitespace on save
	autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup Config
	autocmd!

	autocmd BufWritePost .vimrc,.vimrc.local,init.vim,plugins.vim,ginit.vim ++nested source %

	" Disables automatic commenting on newline
	" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd VimResized * exe 'normal! \<c-w>='
	autocmd FileType vim setlocal fen fdm=marker

	autocmd FileType skim tnoremap <buffer> <esc> <c-g>
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

  if !has('nvim-0.5') " Fix terminal bug glitch on every keypress
    autocmd TermEnter * setlocal scrolloff=0
    autocmd TermLeave * setlocal scrolloff=3
  endif

	autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')

	autocmd FocusLost * silent! wa

	" Goyo
	autocmd User GoyoEnter Limelight
	autocmd User GoyoLeave Limelight!
augroup END

augroup CustomColors
	autocmd!

	" Para Gotham
	autocmd ColorScheme gotham
		\ highlight Folded ctermbg=green ctermfg=blue
		\ | highlight VertSplit ctermfg=4 ctermbg=10

	autocmd ColorScheme gruvbox
		\	let g:gruvbox_contrast_dark="hard"
		\ | let g:gruvbox_italic=0

	autocmd ColorScheme vim-colors-xcode hi Comment        cterm=italic gui=italic
  autocmd ColorScheme vim-colors-xcode hi SpecialComment cterm=italic gui=italic
  autocmd ColorScheme vim-colors-xcode hi Cursor ctermbg=#ff7ab2 guibg=#ff7ab2

	"ff7ab2
augroup END

augroup Term
	autocmd!
	autocmd TermOpen * setlocal nonu nornu signcolumn=no
	autocmd TermOpen * startinsert
augroup END

" }}}
" Configurações do terminal built-in {{{

let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
	if win_gotoid(s:term_win)
		hide
	else
		new terminal
		exec "resize ".a:height
		try
			exec "buffer ".s:term_buf
			exec "bd terminal"
		catch
			call termopen($SHELL, {"detach": 0})
			let s:term_buf = bufnr("")
			setlocal nonu nornu scl=no nocul
		endtry
		startinsert!
		let s:term_win = win_getid()
	endif
endfunction

function! ElixirFormat() abort
	!mix format %
	e!
endfunction

" }}}
" Functions {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! LightlineReload(colorscheme)
  if a:colorscheme
    let g:lightline.colorscheme = a:colorscheme
  endif
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
" }}}
" {{{ NERDTree
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen=1
"}}}
" {{{ Netrw
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 0
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_winsize = 25
"}}}
" {{{ coc.nvim
let g:coc_global_extensions = [
	\ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-rust-analyzer',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-tslint-plugin',
	\ 'coc-prettier',
	\ 'coc-json',
	\ ]

let g:coc_snippet_next = '<tab>'

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<cr>" :
"       \ <SID>check_back_space() ? "\<cr>" :
"       \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" Autoformat on enter
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
" 				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
" nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <F2> <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}
" {{{ fzf.vim
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = 'right:60%'

command! FZF FloatermNew fzf

nnoremap <leader>F :GFiles<cr>
nnoremap <leader>B :Buffers<cr>
" nnoremap <leader><tab> <plug>(fzf-maps-n)
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)
"}}}
" {{{notational-fzf-vim
let g:nv_search_paths = ['~/.wiki']
"}}}
" {{{ rainbow.vim
let g:rainbow_conf = {
  \ 'separately': {
  \   'vimwiki': 0
  \ }
\ }
" }}}
" {{{ lens.vim
let g:lens#disabled_filetypes = ['NERDTree', 'FZF']
" }}}
" {{{vim-zettel
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
" }}}
" {{{lightline.vim
command! -nargs=1 LightlineReload call LightlineReload(<args>)

" {{{sneak.vim
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" }}}
" vim: fdm=marker fdl=0
