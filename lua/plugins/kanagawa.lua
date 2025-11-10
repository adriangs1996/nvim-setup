return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1001,
  opts = {},

  config = function()
    local tk = require("tokyonight.colors.moon")
    local cp = require("catppuccin.palettes.mocha")

    require("kanagawa").setup({
      keywordStyle = { italic = true },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
        palette = {
          -- change all usages of these colors
          fujiWhite = "#dcd7c0",
        },
      },

      overrides = function(colors)
        local theme = colors.theme

        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end

        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

          ["@lsp.mod.readonly"] = { fg = colors.palette.fujiWhite },

          ["@keyword.return"] = { fg = colors.palette.waveRed },
          ["@keyword.exception"] = { fg = colors.palette.waveRed },
          ["@keyword.conditional"] = { fg = colors.palette.waveRed },
          ["Conditional"] = { fg = colors.palette.waveRed },

          ["@keyword.operator"] = { fg = colors.palette.oniViolet },
          ["Operator"] = { fg = colors.palette.oniViolet },

          -- ["@parameter"] = { fg = colors.palette.oldWhite },
          -- ["@variable.parameter"] = { fg = colors.palette.oldWhite },

          -- ["@property"] = { fg = colors.palette.springBlue },
          -- ["@variable.member"] = { fg = colors.palette.springBlue },

          ["@lsp.type.interface"] = { fg = colors.palette.sakuraPink },
          ["Interface"] = { fg = colors.palette.sakuraPink },

          ["@lsp.typemod.method.defaultLibrary"] = { fg = colors.palette.waveBlue },
          ["@lsp.typemod.method.defaultLibrary.typescript"] = { fg = colors.palette.waveBlue },

          -- ["Special"] = { fg = colors.palette.crystalBlue },
          ["Special"] = { fg = colors.palette.waveRed },

          ["@string.special.symbol"] = { fg = colors.palette.sakuraPink },

          ["@tag.tsx"] = { fg = colors.palette.waveAqua2 },
          ["@type.builtin.typescript"] = { fg = colors.palette.waveAqua2 },
          ["@type.builtin"] = { fg = colors.palette.waveAqua2 },
        }
      end,
    })
  end,
}
