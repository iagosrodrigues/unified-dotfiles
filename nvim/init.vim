set background=light

if exists('g:vscode')
    source ~/.config/nvim/vscode.vim
else
    " source ~/.config/nvim/normal.vim
    luafile ~/.config/nvim/normal.lua
endif
" source ~/.config/nvim/normal.vim
