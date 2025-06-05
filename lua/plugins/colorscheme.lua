return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.10, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,

    opts = {
      theme = "wave", -- Set the theme variant to 'dragon'
      compile = false, -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = false, -- define vim.g.terminal_color_{0,17}
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
      colors = {
        palette = {
          sumiInk0 = "#16161D",
          sumiInk1 = "#181820",
          sumiInk2 = "#1a1a22",
          sumiInk3 = "#191724", -- custom to be like rose-pine
          sumiInk4 = "#2A2A37",
          sumiInk5 = "#363646",
          sumiInk6 = "#54546D", --fg

          -- Popup and Floats
          waveBlue1 = "#223249",
          waveBlue2 = "#2D4F67",

          -- Diff and Git
          winterGreen = "#2B3328",
          winterYellow = "#49443C",
          winterRed = "#43242B",
          winterBlue = "#252535",
          autumnGreen = "#76946A",
          autumnRed = "#C34043",
          autumnYellow = "#DCA561",

          -- Diag
          samuraiRed = "#E82424",
          roninYellow = "#FF9E3B",
          waveAqua1 = "#6A9589",
          dragonBlue = "#658594",

          -- Fg and Comments
          oldWhite = "#C8C093",
          fujiWhite = "#DCD7BA",
          fujiGray = "#727169",

          oniViolet = "#C3A7E7", -- Custom to be like rose-pine
          oniViolet2 = "#b8b4d0",
          crystalBlue = "#7E9CD8",
          springViolet1 = "#938AA9",
          springViolet2 = "#9CABCA",
          springBlue = "#7FB4CA",
          lightBlue = "#A3D4D5", -- unused yet
          waveAqua2 = "#7AA89F", -- improve lightness: desaturated greenish Aqua

          -- waveAqua2  = "#68AD99",
          -- waveAqua4  = "#7AA880",
          -- waveAqua5  = "#6CAF95",
          -- waveAqua3  = "#68AD99",

          springGreen = "#98BB6C",
          boatYellow1 = "#938056",
          boatYellow2 = "#C0A36E",
          carpYellow = "#E6C384",

          sakuraPink = "#D27E99",
          waveRed = "#E46876",
          peachRed = "#FF5D62",
          surimiOrange = "#FFA066",
          katanaGray = "#717C7C",

          dragonBlack0 = "#0d0c0c",
          dragonBlack1 = "#12120f",
          dragonBlack2 = "#1D1C19",
          dragonBlack3 = "#181616",
          dragonBlack4 = "#282727",
          dragonBlack5 = "#393836",
          dragonBlack6 = "#625e5a",

          dragonWhite = "#c5c9c5",
          dragonGreen = "#87a987",
          dragonGreen2 = "#8a9a7b",
          dragonPink = "#a292a3",
          dragonOrange = "#b6927b",
          dragonOrange2 = "#b98d7b",
          dragonGray = "#a6a69c",
          dragonGray2 = "#9e9b93",
          dragonGray3 = "#7a8382",
          dragonBlue2 = "#8ba4b0",
          dragonViolet = "#8992a7",
          dragonRed = "#c4746e",
          dragonAqua = "#8ea4a2",
          dragonAsh = "#737c73",
          dragonTeal = "#949fb5",
          dragonYellow = "#c4b28a", --"#a99c8b",
          -- "#8a9aa3",

          lotusInk1 = "#545464",
          lotusInk2 = "#43436c",
          lotusGray = "#dcd7ba",
          lotusGray2 = "#716e61",
          lotusGray3 = "#8a8980",
          lotusWhite0 = "#d5cea3",
          lotusWhite1 = "#dcd5ac",
          lotusWhite2 = "#e5ddb0",
          lotusWhite3 = "#f2ecbc",
          lotusWhite4 = "#e7dba0",
          lotusWhite5 = "#e4d794",
          lotusViolet1 = "#a09cac",
          lotusViolet2 = "#766b90",
          lotusViolet3 = "#c9cbd1",
          lotusViolet4 = "#624c83",
          lotusBlue1 = "#c7d7e0",
          lotusBlue2 = "#b5cbd2",
          lotusBlue3 = "#9fb5c9",
          lotusBlue4 = "#4d699b",
          lotusBlue5 = "#5d57a3",
          lotusGreen = "#6f894e",
          lotusGreen2 = "#6e915f",
          lotusGreen3 = "#b7d0ae",
          lotusPink = "#b35b79",
          lotusOrange = "#cc6d00",
          lotusOrange2 = "#e98a00",
          lotusYellow = "#77713f",
          lotusYellow2 = "#836f4a",
          lotusYellow3 = "#de9800",
          lotusYellow4 = "#f9d791",
          lotusRed = "#c84053",
          lotusRed2 = "#d7474b",
          lotusRed3 = "#e82424",
          lotusRed4 = "#d9a594",
          lotusAqua = "#597b75",
          lotusAqua2 = "#5e857a",
          lotusTeal1 = "#4e8ca2",
          lotusTeal2 = "#6693bf",
          lotusTeal3 = "#5a7785",
          lotusCyan = "#d7e3d8",
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {
          NormalFloat = { bg = "none" }, -- Transparent background for floating windows
          FloatBorder = { bg = "none" }, -- Transparent background for floating window borders
          FloatTitle = { bg = "none" }, -- Transparent background for floating window titles

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 }, -- Custom colors for dark mode

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Lazy plugin
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Mason plugin

          FzfLuaNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 }, -- Custom colors for FzfLua normal
          FzfLuaBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 }, -- Custom colors for FzfLua border
          FzfLuaTitle = { fg = theme.ui.special, bold = true }, -- Custom colors for FzfLua title

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- Custom colors for popup menu
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 }, -- Custom colors for selected item in popup menu
          PmenuSbar = { bg = theme.ui.bg_m1 }, -- Custom colors for popup menu scrollbar
          PmenuThumb = { bg = theme.ui.bg_p2 }, -- Custom colors for popup menu thumb

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
    },
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    colours_override = function(palette)
      palette.bg0 = "#1D2326"
    end,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
      vim.g.everforest_ui_contrast = "high"
      vim.g.everforest_float_style = "dim"
    end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
