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
  "gbprod/nord.nvim",
  config = function()
    -- local tk = require("tokyonight.colors.storm")
    -- local cp = require("catppuccin.palettes.frappe")
    -- local rp = require("rose-pine.palette")

    require("nord").setup({

      transparent = true, -- Enable this to disable setting the background color

      ---@param c Nord.Palette
      on_highlights = function(h, c)
        -- h["Type"] = { fg = tk.red }
        -- h["@type"] = { fg = tk.red }
        -- h["@tag.tsx"] = { fg = tk.red }
        -- h["Type"] = { fg = c.aurora.yellow }
        -- h["@type"] = { fg = c.aurora.yellow }
        -- h["@tag.tsx"] = { fg = c.aurora.yellow }
        h["Type"] = { fg = "#8FBCB0" }
        h["@type"] = { fg = "#8FBCB0" }
        h["@tag.tsx"] = { fg = "#8FBCB0" }

        h["@function"] = { fg = c.frost.ice }
        h["@function.method"] = { fg = c.frost.ice }
        h["@function.call"] = { fg = c.frost.ice }
        h["@function.method.call"] = { fg = c.frost.ice }

        h["@string.special.symbol.ruby"] = { fg = c.aurora.purple }

        -- h["@variable.parameter"] = { fg = rp.iris, italic = true }
        h["@variable.parameter"] = { fg = c.aurora.red, italic = true }

        h["Interface"] = { fg = c.aurora.yellow }
        h["@constant"] = { fg = c.aurora.yellow }
        h["@lsp.type.interface"] = { fg = c.aurora.yellow }
        h["@lsp.type.namespace"] = { fg = c.aurora.yellow }

        h["@variable.member"] = { fg = c.aurora.orange }
        h["@tag.attribute"] = { fg = c.aurora.orange }
        h["@property"] = { fg = c.aurora.orange }
        h["rubyInstanceVariable"] = { fg = c.aurora.orange }

        h["Special"] = { fg = c.aurora.red }

        h["@function.builtin"] = { fg = c.aurora.red }
      end,
    })
  end,
}
