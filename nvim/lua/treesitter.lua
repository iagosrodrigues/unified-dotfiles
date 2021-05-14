require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
