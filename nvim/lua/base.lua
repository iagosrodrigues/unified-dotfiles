local support = require('support')

local autocmd = vim.api.nvim_create_autocmd

vim.cmd "autocmd!"

support.set_opts {
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  guicursor = "a:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  colorcolumn = "120",
  title = true,
  smartindent = true,
  hlsearch = false,
  backup = false,
  showcmd = true,
  cmdheight = 1,
  conceallevel = 2,
  copyindent = true,
  laststatus = 2,
  bufhidden = "unload",
  formatoptions = "cqrnj",
  expandtab = true,
  scrolloff = 10,
  shell = "fish",
  inccommand = "split",
  ignorecase = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 4,
  tabstop = 4,
  wrap = false,
  history = 100,
  joinspaces = false,
  lazyredraw = true,
  linebreak = true,
  list = true,
  magic = true,
  mouse = "a",
  pumblend = 20,
  pyxversion = 3,
  relativenumber = true,
  report = 0,
  shada = "",
  shiftround = true,
  shortmess = "filnxtToOFc",
  showbreak = "↪",
  showmode = false,
  smartcase = true,
  softtabstop = 4,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  switchbuf = "useopen",
  synmaxcol = 128,
  termguicolors = true,
  timeoutlen = 200,
  undodir = vim.fn.expand "~/.config/nvim/undodir",
  undofile = true,
  updatetime = 250,
  signcolumn = "yes",
  wildignore = "*\\tmp\\*,*.swp,*.zip,*.exe,*.tmp,.DS_Store",
  wildmode = "longest,list,full",
  wildoptions = "pum",
  writebackup = false,
  backspace = { "start", "eol", "indent" },
  diffopt = { "internal", "filler", "closeoff", "context:4", "vertical" },
  guifont = { "RandyGG", ":h22" },
  backupskip = { "/tmp/*", "/private/tmp/*" },
  listchars = {
    tab = "→ ",
    eol = "¬",
    trail = "·",
    extends = "❯",
    precedes = "❮",
    nbsp = "␣",
  }
}

support.set_globals {
  mapleader = " ",
  maplocalleader = " ",
  matchup_transmute_enabled = 1,
  matchup_surround_enabled = 1,
  matchup_matchparen_deferred = 1,
  matchup_matchparen_hi_surround_always = 1,
}

vim.scriptencoding = "utf-8"

vim.wo.number = true

vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.formatoptions:append { "r" }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Remove whitespaces when save a file
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
