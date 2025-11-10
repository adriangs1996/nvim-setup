local dp = {
  green = "#8AFF80",
  purple = "#9580FF",
  red = "#E46876",
  pink = "#FF80BF",
  pink2 = "#FF82AF",
  -- pink3 = "#F872DE",
  pink3 = "#ff8cc6",
  yellow = "#FFFF80",
  orange = "#FFCA80",
  cyan = "#80FFEA",
  mutedBlue = "#658594",
  peach = "#FFA066",
}

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local bg = "#1e1e2e"

    local palettef = require("catppuccin.palettes.frappe")
    local palettem = require("catppuccin.palettes.macchiato")
    local palette = require("catppuccin.palettes.mocha")
    local tk = require("tokyonight.colors.night")
    local tkm = require("tokyonight.colors.moon")

    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg
        colors.bg_popup = bg
      end,

      on_highlights = function(h, c)
        h["Type"] = { fg = dp.pink }
        h["Constant"] = { fg = tk.orange }
        h["Special"] = { fg = tk.blue }
        h["Function"] = { fg = palettef.yellow }

        h["String"] = { fg = "#4da97b" }

        h["@constructor"] = { fg = dp.pink }
        h["PreProc"] = { fg = tk.purple }
        h["@operator"] = { fg = tk.purple }
        h["Statement"] = { fg = tk.purple }
        h["@keyword.function"] = { fg = tk.purple, italic = true }

        h["@property"] = { fg = palettef.sapphire }
        h["@lsp.type.fieldName"] = { fg = palettef.sapphire }
        h["@string.special.symbol.ruby"] = { fg = palettef.sapphire }
        h["@variable.member"] = { fg = palettef.sapphire }
        h["@variable.member.ruby"] = { fg = palettef.green }

        h["@variable.parameter"] = { fg = palette.lavender, italic = true }

        h["Interface"] = { fg = palettem.peach }
        h["@lsp.type.interface"] = { fg = palettem.peach }
        h["@lsp.type.namespace"] = { fg = palettem.peach }
      end,
    })

    vim.api.nvim_set_hl(0, "MyCustomType", { fg = palettem.peach })
    -- vim.api.nvim_set_hl(0, "Decorators", { fg = palettef.blue })
    vim.api.nvim_set_hl(0, "Decorators", { link = "@type.builtin" })
    vim.api.nvim_set_hl(0, "get", { fg = palettef.flamingo })
    vim.api.nvim_set_hl(0, "post", { fg = palettef.flamingo })
    vim.api.nvim_set_hl(0, "put", { fg = palettef.flamingo })
    vim.api.nvim_set_hl(0, "delete", { fg = palettef.flamingo })
    vim.api.nvim_set_hl(0, "sign", { fg = palettef.flamingo })
    vim.api.nvim_set_hl(0, "inject", { fg = palettef.flamingo })
    vim.fn.matchadd("MyCustomType", "\\<I[A-Z]\\w\\+\\>")
    vim.fn.matchadd("Decorators", "@\\w\\+\\(?:\\.\\w\\+\\)*")
    vim.fn.matchadd("get", "^\\s*get\\> ")
    vim.fn.matchadd("post", "^\\s*post\\> ")
    vim.fn.matchadd("put", "^\\s*put\\> ")
    vim.fn.matchadd("delete", "^\\s*delete\\> ")
    vim.fn.matchadd("sign", "^\\s*sign\\> ")
    vim.fn.matchadd("inject", "^\\s*inject\\> ")
  end,
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "catppuccin-mocha",
  --     colorscheme = "tokyonight",
  --   },
  -- },
}
