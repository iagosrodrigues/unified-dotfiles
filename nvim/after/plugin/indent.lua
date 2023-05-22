local present, indent = pcall(require, "indent_blankline")

if present then
  indent.setup {
    char = "▏",
    buftype_exclude = { "terminal" },
    filetype_exclude = { "help", "packer", "NvimTree", "Trouble" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    space_char_blankline = " ",
    use_treesitter = true,
    --[[ context_patterns = {
      "class",
      "function",
      "method",
      "block",
      "list_literal",
      "selector",
      "^if",
      "^table",
      "if_statement",
      "while",
      "for",
    }, ]]
    show_current_context = true,
    show_current_context_start = true,
  }
end
