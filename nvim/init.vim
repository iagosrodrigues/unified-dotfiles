syntax on
filetype plugin indent on
scriptencoding utf-8

set pyxversion=3
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

let s:gold_numbers = 0
let s:noamcore_bg_transparent=0
let s:noamcore_wayland=0
if executable('tmux') && $TMUX !=# ''
	let g:tmux = 1
else
	let g:tmux = 0
endif

source ~/.config/nvim/plugins.vim

set pumblend=20

set mouse=a

let g:airline#extensions#fzf#enabled = 0

set noshowmode
set noshowmatch
set nohlsearch
set cmdheight=2
set shortmess+=c

set undodir=~/.config/nvim/undodir
set undofile

set switchbuf="useopen"
set bufhidden="unload"

set termguicolors
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italic=1
let g:gruvbox_invert_selection='0'
let g:xcodedark_match_paren_style = 1
colorscheme gruvbox

set hidden
set nojoinspaces
set report=0
set backspace=indent,eol,start
set clipboard=unnamedplus
set conceallevel=2
set shada="NONE"
" Visual {{{2
set fillchars+=vert:\|
set number
set relativenumber
set noequalalways
set splitbelow
set splitright
set listchars=tab:→\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:␣
set nolist
set updatetime=50
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
set cursorline
set lazyredraw
set nocompatible
set completeopt+=noselect " TODO
set completeopt-=preview " Desativa o scratch no autocomplete
set diffopt+=context:4,vertical " TODO
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Visual {{{2
set magic      " Ativa magic para expressões regulares
set gdefault   " Pesquisa e substituição são globais por linha
set autoread   " Detecta quando um arquivo é editado
set incsearch  " Mostra enquanto digita
set smartcase  " Se a busca contiver letras maiúsculas, a pesqusa passa a ser case-sensitive
set ignorecase " As pesquisas viram case-insensitive

set noerrorbells
set nobackup   " Desabilita backups
set nowritebackup " Desativa backups
set noswapfile " Desabilita swaps
set fileencoding=utf-8 " Arquivos serão no formato utf-8
set fileformat=unix " Novas linhas no formato LF apenas
" set formatprg=par\ -r " Nome do programa externo que será utilizado para formatar linhas usando o operador gc
set history=100 " Histórico contém no máximo cem comandos
set inccommand=nosplit " Mostra a substituição de texto enquanto você digita
set linebreak " Quebra simples de texto, não insere nova linha
set matchtime=0 " Quantos décimos de segundos ele demora para mostrar o parenteses correspondente
set scrolloff=3 " Número mínimo de linhas à manter acima ou abaixo do cursor
set showbreak=↪ " Mostra o caractere quando quebra a linha
set timeout
set ttimeoutlen=50
set timeoutlen=200 " Tempo em milisegundos à esperar para uma sequência mapeada para completar
set title " Permite alterar o título do terminal
set wildignore=*\\tmp\\*,*.swp,*.zip,*.exe,*.tmp,.DS_Store " Lista de padrões para ignorar no autocomplete
set wildmode=longest,list,full " Completa arquivos como um terminal
set wildmenu " Habilita o menu
set wildoptions=pum
set nowrap
" set wrapmargin=8 " Número de caracteres à borda direita onde será inserido um caracter de nova linha caso ultrapasse
" Indentação {{{
set autoindent    " Indentação automática
set smartindent   " Indentação inteligente ao iniciar uma nova linha

set shiftround    " Arredonda os tabs para um múltiplo do shiftwidth
set smarttab      " Tab respeita o 'shiftwidth'
set expandtab     " Espaço em branco no lugar de tabs

set tabstop=4     " Tamanho visível de um tab
set shiftwidth=4  " Número de espaços usados na hora da indentação. Usado nos comandos cindent, >>, <<
set softtabstop=4 " Edita como se os espaços em branco fossem tabs de tamanho de 4 caracteres

set breakindent   " Linhas quebradas continuam indentadas visualmente
set copyindent    " Copia as linhas com indentação
" }}}
" Configurações de folding {{{1
set nofoldenable       " Desabilita o folding por padrão
set foldmethod=manual  " Método padrão do fold é indentação
set foldmarker={{{,}}} " Marcadores do fold
set foldclose=all      " Permite o folding automaticamente quando não está no cursor ou o nível é maior do que o folding level
set foldlevelstart=20  " Abrir o maior fold por padrão
set foldnestmax=10     " Nível máximo de folding aninhado
" set foldcolumn=3       " Número de colunas para mostrar o folding
" }}}
" Barra de status {{{1
set laststatus=2
" Esquemas customatizados {{{1

if s:noamcore_bg_transparent
    highlight Normal guibg=none
    highlight FoldColumn guibg=none
    highlight SignColumn guibg=none
    highlight EndOfBuffer guifg=bg guibg=none
    highlight CursorLineNr guibg=none
    highlight LineNr guibg=none

    highlight SpecialKey ctermbg=none gui=none ctermfg=8 guifg=8
    highlight NonText ctermbg=none gui=none ctermfg=8 guifg=8

    highlight ErrorSign guibg=#3c3836 guifg=#fb4934
    highlight WarningSign guibg=#3c3836 guifg=#fabd2f
    highlight InfoSign guibg=#3c3836 guifg=#8ec07c
    highlight Search guifg=#282a2e
    highlight DiffAdd guibg=none
    highlight DiffChange guibg=none
    highlight DiffDelete guibg=none
    highlight DiffText guibg=none
    highlight IncSearch guibg=none guifg=#282a2e
    highlight Child guifg=#fb4934 guibg=none cterm=bold gui=bold
    highlight Conceal ctermbg=NONE
    highlight Folded guifg=#838991 guibg=none
endif

if s:gold_numbers
  highlight LineNr guibg=none guifg=Gold
  highlight CursorLineNr gui=bold guifg=LightGoldenrod
endif

" vim-sneak
highlight Sneak guifg=black guibg=orange

" Destaca conflitos do git
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}
" Mapeamento {{{
let mapleader = " " " O padrão é \, mas é mais fácil digitar o vírgula
let g:mapleader = " " " Usado para os scripts

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

" Mover através das linhas visíveis, não das linhas numeradas
noremap j gj
noremap k gk

" Os blocos selecionados continuam selecionados depois de indentar
vnoremap > >gv
vnoremap < <gv

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Voltar para o modo normal com jw
" inoremap jw <esc>
tnoremap <Esc> <C-\><C-n>

" Editar este arquivo
nnoremap <leader>ev :e $MYVIMRC<cr>

" Indentação estilo textmate
vnoremap <leader>[ <gv <leader>
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

" Abrir tags em uma nova aba
nnoremap <silent> <leader><C-]> <C-W><C-]><C-W>T

" vnoremap <leader>su !awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
vnoremap <leader>su :call SortByLineLength()<CR>

function! Cmp(first, second)
    return strlen(a:first) - strlen(a:second)
endfunction

function! SortByLineLength() range abort
    let content = getline(a:firstline, a:lastline)
    call setline(a:firstline, sort(content, "Cmp"))
endfunction

nnoremap <silent><M-t> :FloatermToggle<CR>
inoremap <silent><M-t> <Esc>:FloatermToggle<CR>
tnoremap <silent><M-t> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent><Esc> <C-\><C-n>

nnoremap <leader>u :UndotreeShow<CR>

nmap <leader>ws <plug>VimwikiSplitLink
nmap <leader>wv <plug>VimwikiVSplitLink

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" {{{ Commands
"
command! -nargs=* Make make <args> | cwindow 3

command! ConfigGinit tab drop ~/.config/nvim/ginit.vim
command! ConfigInit tab drop ~/.config/nvim/init.vim
command! ConfigPlugins tab drop ~/.config/nvim/plugins.vim
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

command! -nargs=0 GG :cd ~/Projects
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}

" Plugins {{{1
nnoremap <silent> <leader>k :Explore<CR>

xmap ga <Plug>(EasyAlign)

nmap ga <Plug>(EasyAlign)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" Variáveis de plugins {{{2

let $FZF_DEFAULT_COMMAND='fd'

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

let g:mix_format_on_save = 0
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1
let g:user_emmet_install_global = 0
let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_buffers_jump = 1

let g:rainbow_active = 1

let g:sneak#label = 1
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list=[{'path': '$HOME/.wiki', 'syntax': 'default', 'ext': '.md'}, {'path': '$HOME/.cheat', 'syntax': 'default', 'ext': '.md'}]

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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

augroup Config
	autocmd!

	autocmd BufWritePost .vimrc,.vimrc.local,init.vim,plugins.vim,ginit.vim ++nested source %

	" Disables automatic commenting on newline
	" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	" autocmd VimResized * exe 'normal! \<c-w>='
	autocmd FileType vim setlocal fen fdm=marker

	autocmd FileType skim tnoremap <buffer> <esc> <c-g>

	autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

  if !has('nvim-0.5') " Fix terminal bug glitch on every keypress
    autocmd TermEnter * setlocal scrolloff=0
    autocmd TermLeave * setlocal scrolloff=3
  endif

	autocmd FocusLost * silent! wa

	" Goyo
	autocmd User GoyoEnter Limelight
	autocmd User GoyoLeave Limelight!
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

function GitBlame()
  let buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
  let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0,
      \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
  let win = nvim_open_win(buf, 0, opts)
  call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
endfunction

" }}}
" {{{ Netrw
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_altfile = 1
let g:netrw_liststyle = 0
let g:netrw_keepdir = 1
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_winsize = 25
"}}}
" {{{ coc.nvim
let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

let g:coc_snippet_next = '<tab>'

" {{{ Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" }}}

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info()["selected"] != "-1" ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

inoremap <silent><expr> <tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> K :call <SID>show_documentation()<CR>
nmap <silent><nowait> <leader>o :<C-u>CocList outline<CR>

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

xmap <leader>a <Plug>(coc-codeaction-selected)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <F2> <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

nmap <silent> <Tab> <Plug>(coc-range-select)
xmap <silent> <Tab> <Plug>(coc-range-select)
xmap <silent> <S-Tab> <Plug>(coc-range-select-backword)

nmap <leader>h <Plug>(coc-float-hide)

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

augroup Config
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')
augroup END
" }}}
" {{{ fzf.vim
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = 'right:60%'

nnoremap <C-p> :GFiles<cr>
nnoremap <leader>pf :Files<cr>
nnoremap <leader>b :Buffers<cr>
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)
"}}}
" {{{ rainbow.vim
let g:rainbow_conf = {
  \ 'separately': {
  \   'vimwiki': 0
  \ }
\ }
" }}}

lua require('aniseed.dotfiles')
" vim: fdm=marker fdl=0
