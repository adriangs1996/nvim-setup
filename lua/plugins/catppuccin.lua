local tk_pink = "#fca7ea"

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      color_overrides = {
        mocha = {
          -- text = "#c8d3f5",
          -- base = "#191724",
          pink = tk_pink,
          -- base = "#222436",
          dpink = "#E46876",
          green1 = "#4fd6be",
          -- green = "#c3e88d",
          -- green = "#ffc777",
          -- blue = "#65bcff",
          -- mauve = "#c099ff",
          -- sapphire = "#82aaff",
          -- red = "#ff757f",
        },
        macchiato = {
          -- pink = "#FF80BF",
          pink = tk_pink,
          base = "#222436",
          dpink = "#E46876",
          green1 = "#4fd6be",
          green = "#c3e88d",
          blue = "#65bcff",
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            NvimTreeNormal = { fg = colors.none },
            CmpBorder = { fg = "#3e4145" },
          }
        end,
        latte = function(latte)
          return {
            Normal = { fg = latte.base },
          }
        end,

        mocha = function(colors)
          local rp = require("rose-pine.palette")
          return {
            -- Comment = { fg = colors.surface2, style = { "italic" } }, -- just comments

            Constant = { fg = colors.lavender }, -- (preferred) any constant
            -- Interface = { fg = colors.sky }, -- (preferred) any constant
            -- Statement = { fg = colors.sky }, -- (preferred) any statement
            -- ["@module"] = { fg = colors.sky, style = { "italic" } },
            ["@tag.tsx"] = { fg = colors.yellow, style = { "italic" } },
            -- Character = { fg = colors.sky }, --  a character constant: 'c', '\n'
            -- Type = { fg = colors.sky }, -- (preferred) int, long, char, etcp.
            -- TSField = { fg = colors.sky }, -- For fields.
            -- TSType = { fg = colors.sky }, -- For types.
            -- ["@type"] = { fg = colors.sky }, -- For types.
            -- TSTypeBuiltin = { fg = colors.sky, style = { "italic" } }, -- For builtin types.
            -- ["@type.builtin"] = { fg = colors.sky, style = { "italic" } }, -- For builtin types.

            ["@lsp.type.enumMember"] = { fg = colors.sky, style = { "italic" } },
            ["@lsp.type.namespace"] = { fg = colors.flamingo, style = { "italic" } },
            ["@lsp.type.interface"] = { fg = colors.flamingo, style = { "italic" } },

            -- Number = { fg = colors.peach }, --   a number constant: 234, 0xff
            -- Float = { fg = colors.peach }, --    a floating point constant: 2.3e10
            -- Boolean = { fg = colors.peach }, --  a boolean constant: TRUE, false
            -- TSConstant = { fg = colors.peach }, -- For constants
            -- ["@constant.builtin"] = { fg = colors.peach }, -- For constants
            -- ["@function.method.call"] = { fg = colors.peach }, -- For constants
            -- ["@function.call"] = { fg = colors.peach }, -- For constants

            -- Identifier = { fg = colors.text }, -- (preferred) any variable name
            -- Operator = { fg = colors.text }, -- "sizeof", "+", "*", etcp.
            -- TSParameter = { fg = colors.text, style = { "italic" } }, -- For parameters of a function.
            -- TSOperator = { fg = colors.text },
            -- ["@operator"] = { fg = colors.text },

            -- ["@parameter"] = { fg = colors.peach, style = { "italic" } }, -- For parameters of a function.
            -- ["@variable.parameter"] = { fg = rp.iris, style = { "italic" } }, -- For parameters of a function.

            Conditional = { fg = colors.pink }, --  if, then, else, endif, switch, etcp.
            Repeat = { fg = colors.pink }, --   for, do, while, etcp.
            Exception = { fg = colors.pink }, --   for, do, while, etcp.

            -- Label = { fg = colors.mauve }, --    case, default, etcp.
            -- Keyword = { fg = colors.mauve }, --  any other keyword
            -- PreProc = { fg = colors.mauve }, -- (preferred) generic Preprocessor
            -- TSInclude = { fg = colors.mauve, style = { "italic" } },
            -- ["@include"] = { fg = colors.mauve, style = { "italic" } },
            -- Special = { fg = colors.mauve }, -- (preferred) any special symbol
            -- TSKeywordFunction = { fg = colors.mauve }, -- For keywords used to define a fuction.
            -- ["@keyword.function"] = { fg = colors.mauve }, -- For keywords used to define a fuction.
            -- TSKeyword = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            -- ["@keyword"] = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            -- ["@keyword.export"] = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            -- TSKeywordReturn = { fg = colors.mauve },
            -- ["@keyword.return"] = { fg = colors.mauve },

            -- String = { fg = colors.green, style = { "italic", "bold" } }, -- a string constant: "this is a string"
            -- StorageClass = { fg = colors.green }, -- static, register, volatile, etcp.
            -- Structure = { fg = colors.green }, --  struct, union, enum, etcp.
            -- Typedef = { fg = colors.green }, --  A typedef
            -- TSString = { fg = colors.green, style = { "italic" } }, -- For strings.
            -- ["@string"] = { fg = colors.green, style = { "italic" } }, -- For strings.

            -- ["@field"] = { fg = colors.green1 }, -- For fields.
            -- TSProperty = { fg = colors.green1 }, -- Same as TSField.
            -- ["@property"] = { fg = colors.green1 }, -- Same as TSField.
            ["@tag.attribute"] = { fg = colors.lavender }, -- Same as TSField.
            -- ["@string.special.symbol.ruby"] = { fg = colors.green1 },

            -- TSVariableBuiltin = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
            -- ["@variable.builtin"] = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
            ["@lsp.type.fieldName"] = { fg = colors.lavender }, -- Variable names that are defined by the languages, like this or self.

            -- Include = { fg = colors.blue }, --  preprocessor #include
            -- Function = { fg = colors.sapphire }, -- function name (also: methods for classes)
            -- ["@function.builtin"] = { fg = colors.sapphire }, -- For function (calls and definitions).
            -- TSFunction = { fg = colors.sapphire }, -- For function (calls and definitions).
            -- TSMethod = { fg = colors.sapphire }, -- For method calls and definitions.
            -- ["@function.ruby"] = { fg = colors.sapphire },
            -- ["@lsp.typemod.function.declaration"] = { fg = colors.sapphire },

            -- BufferLineBufferVisible = { fg = colors.surface1, bg = "NONE" },
            -- BufferLineBufferSelected = { fg = colors.text, bg = "NONE", style = { "bold", "italic" } }, -- current
            -- BufferLineSeparator = { fg = colors.mauve, bg = "NONE" },
            -- BufferLineIndicatorSelected = { fg = colors.mauve, bg = "NONE" },
            -- BufferLineFill = { bg = colors.base },
          }
        end,
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        -- bufferline = true,
      },
    },
  },
}
