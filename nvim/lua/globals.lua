set_globals {
  ['airline#extensions#fzf#enabled'] = 0,
  ['airline#extensions#nvimlsp#enabled'] = 1,

  cursorhold_updatetime = 1000,

  matchup_matchparen_offscreen = {
    method = 'popup',
  },

  vimsyn_embed = 'lp',

  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  loaded_python_provider = 0,

  gruvbox_material_enable_italic = 1,
  gruvbox_material_background = 'soft',
  gruvbox_material_sign_column_background = 'default',
  gruvbox_material_diagnostic_virtual_text = 'colored',
  gruvbox_material_better_performance = 1,

  mapleader = ' ',

  -- plugins
  rainbow_conf = {
    separately = {
      vimwiki = 0,
    },
  },

  rainbow_active = 1,

  ['sneak#label'] = 1,

  vimwiki_list = {
    {path = '$HOME/.wiki', syntax = 'default', ext = '.md'},
    {path = '$HOME/.cheat', syntax = 'default', ext = '.md'}
  },

  terraform_align = 1,
  terraform_fmt_on_save = 1,

  symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    keymaps = {
      close = "<Esc>",
      goto_location = "<cr>",
      focus_location = "o",
      hover_symbol = "<c-space>",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = {},
  },

  tex_conceal="ags",

  ['prettier#exec_cmd_async'] = 1,
  ['prettier#quickfix_auto_focus'] = 0,

  fzf_buffers_jump = 1,
  fzf_preview_window = '',
  fzf_layout = { window = '10split enew' },

  netrw_cursor = 0,
  netrw_bufsettings = 'noma nomod nonu nobl nowrap ro rnu',
  netrw_banner = 0,
  netrw_altv = 1,
  netrw_altfile = 1,
  netrw_liststyle = 0,
  netrw_keepdir = 1,
  netrw_sort_by = 'name',
  netrw_sort_direction = 'normal',
  netrw_winsize = 25,

  floaterm_position = 'center',

  mix_format_on_save = 0,
  mix_format_options = '--check-equivalent',
  mix_format_silent_errors = 1,

  user_emmet_install_global = 0,
}
