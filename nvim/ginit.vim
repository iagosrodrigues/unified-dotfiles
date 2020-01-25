" Configurações do neovim em modo não-console {{{
if exists('g:GuiLoaded')
    set termguicolors
    " Tema {{{
    colorscheme PaperColor
    " }}}

    " Tenta carregar Menlo
    GuiTabline 0
    GuiFont! Menlo:h10
    GuiPopupmenu 0
    " set linespace=10
endif
