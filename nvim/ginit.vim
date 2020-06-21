" Configurações do neovim em modo não-console {{{
set guifont=JetbrainsMono\ Nerd\ Font:h14
if exists('g:GuiLoaded')
  " set guifont="JetBrainsMono Nerd Font:h14"
  let g:neovide_cursor_vfx_mode = "railgun"
  set guifont=SF\ Mono:h12
    " Tema {{{
    " colorscheme PaperColor
    " }}}

    " Tenta carregar Menlo
    " GuiTabline 0
    " GuiFont! Menlo:h10
    " GuiPopupmenu 0
    " set linespace=10
endif
