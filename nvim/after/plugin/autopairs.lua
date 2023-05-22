local present, autopairs = pcall(require, "nvim-autopairs")

if present then
  autopairs.setup {
    disable_filetype = { "TelescopePrompt", "vim" },
  }
end
