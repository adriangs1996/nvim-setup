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
        },
        macchiato = {
          -- pink = "#FF80BF",
          pink = tk_pink,
          base = "#1e1e2e",
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

        macchiato = function(colors)
          return {
            Comment = { fg = colors.surface2, style = { "italic" } }, -- just comments

            Constant = { fg = colors.mauve }, -- (preferred) any constant
            Interface = { fg = colors.mauve }, -- (preferred) any constant
            Statement = { fg = colors.mauve }, -- (preferred) any statement
            ["@module"] = { fg = colors.mauve, style = { "italic" } },
            ["@lsp.type.interface"] = { fg = colors.mauve, style = { "italic" } },

            Number = { fg = colors.pink }, --   a number constant: 234, 0xff
            Float = { fg = colors.pink }, --    a floating point constant: 2.3e10
            Boolean = { fg = colors.pink }, --  a boolean constant: TRUE, false
            TSConstant = { fg = colors.pink }, -- For constants
            ["@constant.builtin"] = { fg = colors.pink }, -- For constants

            Identifier = { fg = colors.text }, -- (preferred) any variable name
            Operator = { fg = colors.text }, -- "sizeof", "+", "*", etcp.
            TSParameter = { fg = colors.text, style = { "italic" } }, -- For parameters of a function.
            TSOperator = { fg = colors.text },
            ["@operator"] = { fg = colors.text },

            ["@parameter"] = { fg = colors.sky, style = { "italic" } }, -- For parameters of a function.
            ["@variable.parameter"] = { fg = colors.sky, style = { "italic" } }, -- For parameters of a function.

            Conditional = { fg = colors.pink }, --  if, then, else, endif, switch, etcp.
            Repeat = { fg = colors.pink }, --   for, do, while, etcp.

            Label = { fg = colors.blue }, --    case, default, etcp.
            Keyword = { fg = colors.blue }, --  any other keyword
            Exception = { fg = colors.blue }, --  any other keyword
            PreProc = { fg = colors.blue }, -- (preferred) generic Preprocessor
            TSInclude = { fg = colors.blue, style = { "italic" } },
            ["@include"] = { fg = colors.blue, style = { "italic" } },
            Special = { fg = colors.blue }, -- (preferred) any special symbol
            TSKeywordFunction = { fg = colors.blue }, -- For keywords used to define a fuction.
            ["@keyword.function"] = { fg = colors.blue }, -- For keywords used to define a fuction.
            TSKeyword = { fg = colors.blue }, -- For keywords that don't fall in previous categories.
            ["@keyword"] = { fg = colors.blue }, -- For keywords that don't fall in previous categories.
            ["@keyword.export"] = { fg = colors.blue }, -- For keywords that don't fall in previous categories.
            TSKeywordReturn = { fg = colors.blue },
            BufferLineSeparator = { fg = colors.blue, bg = "NONE" },
            ["@keyword.return"] = { fg = colors.blue },
            BufferLineIndicatorSelected = { fg = colors.blue, bg = "NONE" },

            String = { fg = colors.green, style = { "italic", "bold" } }, -- a string constant: "this is a string"
            StorageClass = { fg = colors.green }, -- static, register, volatile, etcp.
            Structure = { fg = colors.green }, --  struct, union, enum, etcp.
            Typedef = { fg = colors.green }, --  A typedef
            TSString = { fg = colors.green, style = { "italic" } }, -- For strings.
            ["@string"] = { fg = colors.green, style = { "italic" } }, -- For strings.

            Character = { fg = colors.teal }, --  a character constant: 'c', '\n'
            Type = { fg = colors.teal }, -- (preferred) int, long, char, etcp.
            TSField = { fg = colors.peach }, -- For fields.
            TSType = { fg = colors.teal }, -- For types.
            ["@type"] = { fg = colors.teal }, -- For types.
            TSTypeBuiltin = { fg = colors.teal, style = { "italic" } }, -- For builtin types.
            ["@type.builtin"] = { fg = colors.teal, style = { "italic" } }, -- For builtin types.

            ["@field"] = { fg = colors.lavender }, -- For fields.
            TSProperty = { fg = colors.lavender }, -- Same as TSField.
            ["@property"] = { fg = colors.lavender }, -- Same as TSField.
            ["@string.special.symbol.ruby"] = { fg = colors.lavender },

            TSVariableBuiltin = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
            ["@variable.builtin"] = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.

            Include = { fg = colors.yellow }, --  preprocessor #include
            Function = { fg = colors.yellow }, -- function name (also: methods for classes)
            ["@function.builtin"] = { fg = colors.yellow }, -- For function (calls and definitions).
            TSFunction = { fg = colors.yellow }, -- For function (calls and definitions).
            TSMethod = { fg = colors.yellow }, -- For method calls and definitions.

            ["@function.ruby"] = { fg = colors.yellow },
            ["@lsp.typemod.function.declaration"] = { fg = colors.yellow },

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
      colorscheme = "catppuccin-macchiato",
    },
  },
}
