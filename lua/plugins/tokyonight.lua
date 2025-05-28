return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "moon",

    on_colors = function(colors)
      colors.bg = "#191724"
    end,
  },
}
