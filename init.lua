-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function highlight(group, table)
  local fg = table.fg and table.fg or "NONE"
  local bg = table.bg and table.bg or "NONE"
  local style = table.gui and table.gui or "NONE"

  local cmd = "highlight! " .. group .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. style
  vim.cmd(cmd)
end

local dp = {
  green = "#8AFF80",
  purple = "#9580FF",
  red = "#E46876",
  pink = "#FF80BF",
  yellow = "#FFFF80",
  orange = "#FFCA80",
  cyan = "#80FFEA",
  mutedBlue = "#658594",
  peach = "#FFA066",
}

-- vim.highlight.priorities.semantic_tokens = 95
if vim.g.colors_name == "catppuccin-mocha" then
  -- highlight("Normal", { bg = "#1e1e2e" })
  highlight("Normal", { bg = "#191724" })
  -- highlight("Normal", { bg = "#1e1f22" })
  local palette = require("catppuccin.palettes.mocha")
  local rp = require("rose-pine.palette")
  local palettemo = require("catppuccin.palettes.frappe")
  local palettefo = require("catppuccin.palettes.macchiato")
  local tk = require("tokyonight.colors.moon")
  vim.api.nvim_set_hl(0, "MyCustomType", { fg = palette.mauve })
  -- vim.api.nvim_set_hl(0, "Decorators", { fg = palette.mauve })
  vim.api.nvim_set_hl(0, "SelfT", { fg = dp.purple })
  vim.fn.matchadd("MyCustomType", "\\<I[A-Z]\\w\\+\\>")
  vim.fn.matchadd("Decorators", "@\\w\\+\\(?:\\.\\w\\+\\)*")
  vim.fn.matchadd("SelfT", "self")

  local groups = {
    ["@lsp.type.enum"] = { fg = palette.mauve },
    ["@tag.tsx"] = { fg = palette.sapphire },

    ["@variable.builtin"] = { fg = dp.purple },
    ["@constant.builtin"] = { fg = dp.purple },
    ["Number"] = { fg = dp.purple },
    ["Boolean"] = { fg = dp.purple },
    ["@string.special.symbol.ruby"] = { fg = palette.blue },

    ["@variable.member.ruby"] = { fg = palette.blue },
    ["@variable.member"] = { fg = palette.blue },
    ["@property"] = { fg = palette.blue },

    ["@lsp.type.interface"] = { fg = palette.mauve },
    ["@lsp.type.decorator"] = { fg = palette.mauve },
    ["@attribute"] = { fg = palette.mauve },
    ["@attribute.builtin"] = { fg = palette.mauve },
    ["@module"] = { fg = palette.mauve },
    ["@namespace"] = { fg = palette.mauve },

    ["@parameter"] = { fg = palette.peach },
    ["@lsp.type.parameter"] = { fg = palette.peach },
    ["@variable.parameter"] = { fg = palette.peach },

    ["Operator"] = { fg = dp.pink },

    ["Comment"] = { fg = dp.mutedBlue },

    ["Conditional"] = { fg = dp.pink },
    ["@constant.builtin.python"] = { fg = dp.pink },
    ["@type.builtin"] = { fg = dp.pink },
    ["@boolean.python"] = { fg = dp.pink },
    ["Keyword"] = { fg = dp.pink },
    ["Statement"] = { fg = dp.pink },
    ["@keyword"] = { fg = dp.pink },
    ["@keyword.function"] = { fg = dp.pink },
    ["@keyword.exception"] = { fg = dp.pink },
    ["@keyword.return"] = { fg = dp.pink },
    ["@keyword.repeat"] = { fg = dp.pink },

    ["Function"] = { fg = palettefo.green },

    ["Type"] = { fg = palette.sky },
    ["@constructor"] = { fg = palette.sky },

    ["String"] = { fg = palettemo.yellow },
    ["@string.documentation"] = { fg = palettemo.yellow },

    ["Include"] = { fg = palette.blue },
    ["@function.builtin"] = { fg = palette.blue },
  }

  for group, colors in pairs(groups) do
    highlight(group, colors)
  end
end
