(module dotfiles.init
  {require {nvim aniseed.nvim}})

(nvim.ex.syntax :on)
(set nvim.o.termguicolors true)
(nvim.ex.colorscheme "gruvbox")

(set nvim.o.mouse "a")
(set nvim.o.pyxversion 3)
