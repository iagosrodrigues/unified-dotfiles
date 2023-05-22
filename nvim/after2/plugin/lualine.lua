local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local icons = {
  kind = {
    Array = "",
    Boolean = "蘒",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "ﳠ",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "➜",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },
  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = " ",
    Scopes = "",
    Watches = "",
    DebugConsole = " ",
    Calendar = "",
    Check = "",
    ChevronRight = ">",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = "",
    Close = "",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "…",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "",
    FindText = "",
    Fire = "",
    Folder = "",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "",
    Plus = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "",
    Table = "",
    Target = "",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "契",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },
  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "",
    Debug = "",
    Trace = "✎",
  },
  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "ﲃ",
    Package = "",
    CircuitBoard = "",
  },
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local mode = {
  function()
    return " " .. icons.ui.Target .. " "
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
}

local diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.LineAdded .. " ",
    modified = icons.git.LineModified .. " ",
    removed = icons.git.LineRemoved .. " ",
  },
  padding = { left = 2, right = 1 },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = nil,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.BoldError .. " ",
    warn = icons.diagnostics.BoldWarning .. " ",
    info = icons.diagnostics.BoldInformation .. " ",
    hint = icons.diagnostics.BoldHint .. " ",
  },
  -- cond = conditions.hide_in_width,
}

local lsp = {
  function(msg)
    msg = msg or "LS Inactive"
    local buf_client_names = {}
    local buf_clients = vim.lsp.buf_get_clients()

    for _, client in pairs(buf_clients) do
      table.insert(buf_client_names, client.name)
    end

    local language_server = "[" .. table.concat(vim.fn.uniq(buf_client_names), ", ") .. "]"

    return language_server
  end,
  color = { gui = "bold" },
  cond = function()
    return vim.o.columns > 100
  end,
}

local spaces = {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    return icons.ui.Tab .. " " .. shiftwidth
  end,
  padding = 1,
}

local filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
local progress = {
  "progress",
  fmt = function()
    return "%P/%L"
  end,
  color = {},
}

lualine.setup {
  style = "default",
  options = {
    theme = "auto",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha" },
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch" },
    lualine_c = { diff },
    lualine_x = {
      diagnostics,
      lsp,
      spaces,
      filetype,
    },
    lualine_y = { "location" },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = { mode },
    lualine_b = { "branch" },
    lualine_c = { diff },
    lualine_x = {
      diagnostics,
      lsp,
      spaces,
      filetype,
    },
    lualine_y = { "location" },
    lualine_z = { progress },
  },
  tabline = {},
  extensions = {},
}
