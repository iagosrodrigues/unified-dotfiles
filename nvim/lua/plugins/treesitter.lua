require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc"},
    highlight = {
        enable = true,
    },
    autotag = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
