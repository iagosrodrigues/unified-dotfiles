require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = false,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
