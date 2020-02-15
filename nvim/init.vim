" Configurações padrões {{{1

source ~/.config/nvim/plugins.vim
syntax on                 " Habilita sistema de destaques de código (highlighting)
filetype plugin indent on " Habilita carregar plugins baseados em extensão
scriptencoding utf-8      " Seleciona utf8 como codificação padrão
set path+=**
set iminsert=0
set imsearch=0

let s:noamcore_bg_transparent=0
let s:noamcore_wayland=0

" Tema {{{2

" colorscheme gruvbox
" set background=dark " Permite temas escolherem cores para um fundo mais escuro
set termguicolors
" colorscheme base16-default-dark
colorscheme base16-eighties

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
set updatetime=300
set signcolumn=yes
" set cursorline
set lazyredraw

" }}}

" Disable cursor shape
" set guicursor=
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
" set laststatus=2
" set statusline=%#CursorColumn#%{fugitive#statusline()}%#LineNr#\ %f%m%r%=%#CursorColumn#\ %y\ %{&fileencoding?&fileencoding:&encoding}\[%{&fileformat}\]\ %p%%\ %l:%c
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

highlight EndOfBuffer guifg=bg guibg=none
highlight ErrorSign guibg=#3c3836 guifg=#fb4934
highlight WarningSign guibg=#3c3836 guifg=#fabd2f
highlight InfoSign guibg=#3c3836 guifg=#8ec07c
highlight Search guifg=#282a2e
highlight IncSearch guibg=none guifg=#282a2e
highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold
highlight LineNr guibg=none guifg=Gold
highlight CursorLineNr gui=bold guifg=LightGoldenrod
highlight Conceal ctermbg=NONE

" highlight clear CursorLine
" highlight CursorLine gui=underline cterm=underline

" vim-sneak
highlight Sneak guifg=black guibg=orange

" Destaca conflitos do git
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}
" Mapeamento {{{1
let mapleader = "," " O padrão é \, mas é mais fácil digitar o vírgula
let g:mapleader = "," " Usado para os scripts

" Desabilitar as setinhas
noremap <left>  <nop>
noremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>

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

nnoremap <leader>sa :w<cr>

" Mover através das linhas visíveis, não das linhas numeradas
noremap j gj
noremap k gk

" Os blocos selecionados continuam selecionados depois de indentar
vnoremap > >gv
vnoremap < <gv

" Fechar o buffer atual
nmap <silent> <space>b :bw<cr>

" Voltar para o modo normal com jw
inoremap jw <esc>
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif

" Desabilita o esc para sair do modo de inserção, forçando o uso do jk
inoremap <esc> <nop>

" Editar este arquivo
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

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

command! -nargs=* Make make <args> | cwindow 3
command! ConfigGinit tab drop ~/.config/nvim/ginit.vim
command! ConfigInit tab drop ~/.config/nvim/init.vim
command! ConfigPlugins tab drop ~/.config/nvim/plugins.vim
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
map <leader>m :Make<CR>

" Plugins {{{1
" Mapeamento para plugins {{{2

" nnoremap <silent> <leader>k :NERDTreeToggle<cr>
" nnoremap <silent> <leader>y :NERDTreeFind<cr>
nnoremap <silent> <leader>k :NERDTreeToggle<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader><tab> <plug>(fzf-maps-n)
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Inicia interativamente o EasyAlign no modo visual (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Inicia interativamente o EasyAlign para um texto ou objeto movimentação (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <F8> :TagbarToggle<CR>

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" }}}
" Variáveis de plugins {{{2

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

let g:coc_global_extensions = [
	\ 'coc-snippets',
  \ 'coc-rls',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-tslint-plugin',
	\ 'coc-prettier',
	\ 'coc-json',
	\ ]

" let g:floaterm_width = float2nr(&columns * 0.8)
" let g:floaterm_height = float2nr(&lines * 0.8)
" let g:floaterm_position = 'center'

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

let g:mix_format_on_save = 0
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_fastbrowse = 1
let g:netrw_winsize = -28
let g:user_emmet_install_global = 0
let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_buffers_jump = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=0
let g:NERDTreeQuitOnOpen=1
let g:lightline = {
	\   'colorscheme': 'PaperColor',
	\   'active': {
	\     'left':[ [ 'mode', 'paste' ],
	\              [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
	\     ],
	\     'right': [ ['lineinfo'], ['percent'], ['pomodoro', 'fileformat', 'fileencoding', 'filetype'] ],
	\   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
	\   'component_function': {
	\     'gitbranch': 'fugitive#head',
	\     'cocstatus': 'coc#status',
	\     'currentfunction': 'CocCurrentFunction',
	\     'pomodoro': 'PomodoroStatus',
	\   }
	\ }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
" let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
" let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline.tabline = { 'left': [ ['tabs'] ], 'right': [ ['close'] ] }

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

	autocmd BufWritePost .vimrc,.vimrc.local,init.vim,plugins.vim,ginit.vim source %

	" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	autocmd CursorHold * silent call CocActionAsync('highlight')

	autocmd VimResized * exe 'normal! \<c-w>='
	autocmd FileType vim setlocal fen fdm=marker

	" autocmd FileType blade,html,css EmmetInstall
	autocmd FileType c nnoremap <silent> <space>b :!cc -Wall % -o %:r && ./%:r<CR>
	autocmd FileType cpp nnoremap <silent> <space>b :!g++ -Wall % -o %:r && ./%:r<CR>
	autocmd FileType fzf tnoremap <buffer> <leader>q <c-c>
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	autocmd BufWritePre *.ts,*.js,*.tsx PrettierAsync

	autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

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
function! PomodoroStatus() abort
	if pomo#remaining_time() ==# '0'
		return "\ue001"
	else
		return "\ue003 ".pomo#remaining_time()
	endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

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

" vim: fdm=marker fdl=0
