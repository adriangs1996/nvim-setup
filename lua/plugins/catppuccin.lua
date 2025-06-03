local tk_pink = "#fca7ea"

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      color_overrides = {
        mocha = {
          -- base = "#191724",
          pink = tk_pink,
          base = "#222436",
          dpink = "#E46876",
          green1 = "#4fd6be",
          green = "#c3e88d",
          blue = "#65bcff",
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
          return {
            Comment = { fg = colors.surface2, style = { "italic" } }, -- just comments

            Constant = { fg = colors.yellow }, -- (preferred) any constant
            Interface = { fg = colors.yellow }, -- (preferred) any constant
            Statement = { fg = colors.yellow }, -- (preferred) any statement
            ["@module"] = { fg = colors.yellow, style = { "italic" } },
            ["@lsp.type.interface"] = { fg = colors.yellow, style = { "italic" } },
            ["@lsp.type.namespace"] = { fg = colors.yellow, style = { "italic" } },

            Number = { fg = colors.peach }, --   a number constant: 234, 0xff
            Float = { fg = colors.peach }, --    a floating point constant: 2.3e10
            Boolean = { fg = colors.peach }, --  a boolean constant: TRUE, false
            TSConstant = { fg = colors.peach }, -- For constants
            ["@constant.builtin"] = { fg = colors.peach }, -- For constants

            Identifier = { fg = colors.text }, -- (preferred) any variable name
            Operator = { fg = colors.text }, -- "sizeof", "+", "*", etcp.
            TSParameter = { fg = colors.text, style = { "italic" } }, -- For parameters of a function.
            TSOperator = { fg = colors.text },
            ["@operator"] = { fg = colors.text },

            ["@parameter"] = { fg = colors.peach, style = { "italic" } }, -- For parameters of a function.
            ["@variable.parameter"] = { fg = colors.peach, style = { "italic" } }, -- For parameters of a function.

            Conditional = { fg = colors.pink }, --  if, then, else, endif, switch, etcp.
            Repeat = { fg = colors.pink }, --   for, do, while, etcp.
            Exception = { fg = colors.pink }, --   for, do, while, etcp.

            Label = { fg = colors.mauve }, --    case, default, etcp.
            Keyword = { fg = colors.mauve }, --  any other keyword
            PreProc = { fg = colors.mauve }, -- (preferred) generic Preprocessor
            TSInclude = { fg = colors.mauve, style = { "italic" } },
            ["@include"] = { fg = colors.mauve, style = { "italic" } },
            Special = { fg = colors.mauve }, -- (preferred) any special symbol
            TSKeywordFunction = { fg = colors.mauve }, -- For keywords used to define a fuction.
            ["@keyword.function"] = { fg = colors.mauve }, -- For keywords used to define a fuction.
            TSKeyword = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            ["@keyword"] = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            ["@keyword.export"] = { fg = colors.mauve }, -- For keywords that don't fall in previous categories.
            TSKeywordReturn = { fg = colors.mauve },
            BufferLineSeparator = { fg = colors.mauve, bg = "NONE" },
            ["@keyword.return"] = { fg = colors.mauve },
            BufferLineIndicatorSelected = { fg = colors.mauve, bg = "NONE" },

            String = { fg = colors.green, style = { "italic", "bold" } }, -- a string constant: "this is a string"
            StorageClass = { fg = colors.green }, -- static, register, volatile, etcp.
            Structure = { fg = colors.green }, --  struct, union, enum, etcp.
            Typedef = { fg = colors.green }, --  A typedef
            TSString = { fg = colors.green, style = { "italic" } }, -- For strings.
            ["@string"] = { fg = colors.green, style = { "italic" } }, -- For strings.

            Character = { fg = colors.yellow }, --  a character constant: 'c', '\n'
            Type = { fg = colors.yellow }, -- (preferred) int, long, char, etcp.
            TSField = { fg = colors.yellow }, -- For fields.
            TSType = { fg = colors.yellow }, -- For types.
            ["@type"] = { fg = colors.yellow }, -- For types.
            TSTypeBuiltin = { fg = colors.yellow, style = { "italic" } }, -- For builtin types.
            ["@type.builtin"] = { fg = colors.yellow, style = { "italic" } }, -- For builtin types.

            ["@field"] = { fg = colors.green1 }, -- For fields.
            TSProperty = { fg = colors.green1 }, -- Same as TSField.
            ["@property"] = { fg = colors.green1 }, -- Same as TSField.
            ["@string.special.symbol.ruby"] = { fg = colors.green1 },

            TSVariableBuiltin = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
            ["@variable.builtin"] = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.

            Include = { fg = colors.blue }, --  preprocessor #include
            Function = { fg = colors.blue }, -- function name (also: methods for classes)
            ["@function.builtin"] = { fg = colors.blue }, -- For function (calls and definitions).
            TSFunction = { fg = colors.blue }, -- For function (calls and definitions).
            TSMethod = { fg = colors.blue }, -- For method calls and definitions.

            ["@function.ruby"] = { fg = colors.blue },
            ["@lsp.typemod.function.declaration"] = { fg = colors.blue },

            BufferLineBufferVisible = { fg = colors.surface1, bg = "NONE" },
            BufferLineBufferSelected = { fg = colors.text, bg = "NONE", style = { "bold", "italic" } }, -- current
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
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
