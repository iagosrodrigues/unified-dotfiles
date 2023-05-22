local status, luasnip = pcall(require, "luasnip")
if not status then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

require "luasnip.loaders"

require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/snippets/" }
luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  --[[ ext_opts = {
    [require('luasnip.util.types').choiceNode] = {
      active = {
        virt_text = { { "O", "Gr" }}
      }
    }
  } ]]
}
