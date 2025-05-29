-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.cursorline = false

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

if vim.g.colors_name == "tokyonight-moon" then
  local tk = require("tokyonight.colors.moon")

  local groups = {
    -- ["@lsp.type.enum"] = { fg = palette.mauve },
    ["@constructor"] = { fg = tk.blue1 },
  }

  for group, colors in pairs(groups) do
    highlight(group, colors)
  end
end

-- vim.highlight.priorities.semantic_tokens = 95
if vim.g.colors_name == "catppuccin-macchiato" then
  --   highlight("Normal", { bg = "#1e1e2e" })
  --   -- highlight("Normal", { bg = "#191724" })
  --   -- highlight("Normal", { bg = "#1e1f22" })
  local palette = require("catppuccin.palettes.macchiato")
  --   local rp = require("rose-pine.palette")
  --   local palettemo = require("catppuccin.palettes.frappe")
  --   local palettefo = require("catppuccin.palettes.macchiato")
  local tk = require("tokyonight.colors.moon")
  vim.api.nvim_set_hl(0, "MyCustomType", { fg = palette.mauve })
  vim.api.nvim_set_hl(0, "Decorators", { fg = palette.flamingo })
  --   vim.api.nvim_set_hl(0, "SelfT", { fg = palette.maroon })
  vim.api.nvim_set_hl(0, "get", { fg = palette.flamingo })
  vim.api.nvim_set_hl(0, "post", { fg = palette.flamingo })
  vim.api.nvim_set_hl(0, "put", { fg = palette.flamingo })
  vim.api.nvim_set_hl(0, "delete", { fg = palette.flamingo })
  vim.api.nvim_set_hl(0, "sign", { fg = palette.flamingo })
  vim.api.nvim_set_hl(0, "inject", { fg = palette.flamingo })
  vim.fn.matchadd("MyCustomType", "\\<I[A-Z]\\w\\+\\>")
  vim.fn.matchadd("Decorators", "@\\w\\+\\(?:\\.\\w\\+\\)*")
  vim.fn.matchadd("get", "^\\s*get\\> ")
  vim.fn.matchadd("post", "^\\s*post\\> ")
  vim.fn.matchadd("put", "^\\s*put\\> ")
  vim.fn.matchadd("delete", "^\\s*delete\\> ")
  vim.fn.matchadd("sign", "^\\s*sign\\> ")
  vim.fn.matchadd("inject", "^\\s*inject\\> ")
  --
  --   -- local groups = {
  --   --   -- ["@lsp.type.enum"] = { fg = palette.mauve },
  --   --   ["@string.special.symbol.ruby"] = { fg = palette.lavender },
  --   --
  --   --   ["@tag.builtin.tsx"] = { fg = tk.red },
  --   --
  --   --   ["@tag.attribute.tsx"] = { fg = palette.mauve },
  --   --
  --   --   ["Boolean"] = { fg = tk.purple },
  --   --   ["Keyword"] = { fg = tk.purple },
  --   --   ["@keyword"] = { fg = tk.purple },
  --   --   ["Operator"] = { fg = tk.purple },
  --   --   ["Conditional"] = { fg = tk.purple },
  --   --   ["Repeat"] = { fg = tk.purple },
  --   --   ["@keyword.export"] = { fg = tk.purple },
  --   --   ["@keyword.exception"] = { fg = tk.purple },
  --   --   ["@keyword.return"] = { fg = tk.purple },
  --   --   ["@keyword.function"] = { fg = tk.purple },
  --   --   ["Include"] = { fg = tk.purple },
  --   --
  --   --   ["variable.member"] = { fg = palette.mauve },
  --   --   ["@variable.member"] = { fg = palette.mauve },
  --   --   ["@property"] = { fg = palette.mauve },
  --   --
  --   --   ["@variable.parameter"] = { fg = palette.peach },
  --   --   ["@parameter"] = { fg = palette.peach },
  --   --
  --   --   ["@constructor"] = { fg = palette.teal },
  --   --   ["Type"] = { fg = palette.teal },
  --   --   ["@type"] = { fg = palette.teal },
  --   --   ["@type.builtin"] = { fg = palette.teal },
  --   --   ["@tag.tsx"] = { fg = palette.teal },
  --   --
  --   --   ["String"] = { fg = palette.green },
  --   --
  --   --   ["function"] = { fg = tk.blue1 },
  --   --   ["@function.builtin"] = { fg = tk.blue1 },
  --   --
  --   --   ["@variable.member.ruby"] = { fg = tk.red },
  --   --   ["@variable.builtin"] = { fg = tk.red },
  --   --
  --   --   ["@constant.builtin"] = { fg = palette.peach },
  --   --
  --   --   ["@lsp.type.interface"] = { fg = palette.yellow },
  --   --   ["@module"] = { fg = palette.yellow },
  --   --   ["@namespace"] = { fg = palette.yellow },
  --   --
  --   --   ["Comment"] = { fg = dp.mutedBlue },
  --   -- }
  --   --
  --
  --   local ghBlueColor = "#a5d6ff"
  --
  --   local githubGroups = {
  --     -- ["@lsp.type.enum"] = { fg = palette.mauve },
  --     ["@string.special.symbol.ruby"] = { fg = ghBlueColor },
  --
  --     ["@tag.builtin.tsx"] = { fg = palette.green },
  --
  --     ["@tag.attribute.tsx"] = { fg = palette.blue },
  --     ["@tag.tsx"] = { fg = palette.peach },
  --
  --     ["Boolean"] = { fg = palette.red },
  --     ["Keyword"] = { fg = palette.red },
  --     ["@keyword"] = { fg = palette.red },
  --     ["Operator"] = { fg = palette.red },
  --     ["Conditional"] = { fg = palette.red },
  --     ["Repeat"] = { fg = palette.red },
  --     ["@keyword.export"] = { fg = palette.red },
  --     ["@keyword.exception"] = { fg = palette.red },
  --     ["@keyword.return"] = { fg = palette.red },
  --     ["@keyword.function"] = { fg = palette.red },
  --     ["Include"] = { fg = palette.red },
  --
  --     ["variable.member"] = { fg = palette.sky },
  --     ["@variable.member"] = { fg = palette.sky },
  --     ["@property"] = { fg = palette.sky },
  --
  --     ["@variable.parameter"] = { fg = palette.rosewater },
  --     ["@parameter"] = { fg = palette.rosewater },
  --
  --     ["@constructor"] = { fg = palette.blue },
  --     ["Type"] = { fg = palette.blue },
  --     ["@type"] = { fg = palette.blue },
  --     ["@type.builtin"] = { fg = palette.blue },
  --     ["@type.builtin.c"] = { fg = palette.blue },
  --
  --     ["String"] = { fg = ghBlueColor },
  --
  --     ["function"] = { fg = palette.mauve },
  --     ["@function.builtin"] = { fg = palette.mauve },
  --
  --     ["@variable.member.ruby"] = { fg = palette.blue },
  --     ["@variable.builtin"] = { fg = palette.peach },
  --
  --     ["@constant.builtin"] = { fg = palette.blue },
  --
  --     ["Macro"] = { fg = palette.peach },
  --     ["@lsp.type.interface"] = { fg = palette.peach },
  --     ["@module"] = { fg = palette.peach },
  --     ["@namespace"] = { fg = palette.peach },
  --
  --     ["Comment"] = { fg = dp.mutedBlue },
  --     ["Number"] = { fg = palette.green },
  --     ["@property.yaml"] = { fg = palette.green },
  --   }
  --
  --   local riderGroups = {
  --     -- ["@lsp.type.enum"] = { fg = palette.mauve },
  --     ["@string.special.symbol.ruby"] = { fg = palette.pink },
  --
  --     ["@tag.builtin.tsx"] = { fg = palette.blue },
  --
  --     ["@tag.attribute.tsx"] = { fg = palette.sapphire },
  --
  --     ["Boolean"] = { fg = palette.blue },
  --     ["Keyword"] = { fg = palette.blue },
  --     ["@keyword"] = { fg = palette.blue },
  --     ["Operator"] = { fg = palette.blue },
  --     ["Conditional"] = { fg = palette.blue },
  --     ["Repeat"] = { fg = palette.blue },
  --     ["@keyword.export"] = { fg = palette.blue },
  --     ["@keyword.exception"] = { fg = palette.blue },
  --     ["@keyword.return"] = { fg = palette.blue },
  --     ["@keyword.function"] = { fg = palette.blue },
  --     ["Include"] = { fg = palette.blue },
  --
  --     ["variable.member"] = { fg = palette.sapphire },
  --     ["@variable.member"] = { fg = palette.sapphire },
  --     ["@property"] = { fg = palette.sapphire },
  --
  --     ["@variable.parameter"] = { fg = palette.rosewater },
  --     ["@parameter"] = { fg = palette.rosewater },
  --
  --     ["@constructor"] = { fg = palette.mauve },
  --     ["Type"] = { fg = palette.mauve },
  --     ["@type"] = { fg = palette.mauve },
  --     ["@type.builtin"] = { fg = palette.mauve },
  --     ["@type.builtin.c"] = { fg = palette.mauve },
  --     ["@tag.tsx"] = { fg = palette.mauve },
  --
  --     ["String"] = { fg = palette.green },
  --
  --     ["function"] = { fg = tk.green1 },
  --     ["@function.builtin"] = { fg = tk.green1 },
  --
  --     ["@variable.member.ruby"] = { fg = tk.red },
  --     ["@variable.builtin"] = { fg = tk.red },
  --
  --     ["@constant.builtin"] = { fg = palette.peach },
  --
  --     ["Macro"] = { fg = palette.yellow },
  --     ["@lsp.type.interface"] = { fg = palette.yellow },
  --     ["@module"] = { fg = palette.yellow },
  --     ["@namespace"] = { fg = palette.yellow },
  --
  --     ["Comment"] = { fg = dp.mutedBlue },
  --     ["Number"] = { fg = tk.purple },
  --   }
  --
  --   for group, colors in pairs(githubGroups) do
  --     highlight(group, colors)
  --   end
end

require("lspconfig").gleam.setup({})
