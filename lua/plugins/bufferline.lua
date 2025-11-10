return {
  "akinsho/bufferline.nvim",
  lazy = true,

  config = function()
    local c = require("nord.colors")
    local cp = require("catppuccin.palettes.mocha")
    local k = require("kanagawa.colors").setup()

    require("bufferline").setup({
      options = {
        separator_style = "slope",
      },

      highlights = {
        separator = {
          fg = k.palette.sumiInk3,
        },
        separator_selected = {
          fg = k.palette.sumiInk3,
        },
        separator_visible = {
          fg = k.palette.sumiInk3,
        },
        fill = {
          bg = k.palette.sumiInk3,
        },
        tab_separator = {
          bg = k.palette.sumiInk3,
        },
        tab = {
          bg = k.palette.sumiInk3,
        },
      },
    })
  end,
}
