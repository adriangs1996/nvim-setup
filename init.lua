--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.opt.swapfile = false
vim.opt.backup = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
vim.opt.virtualedit = "all"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
-- init.lua. If you want these files, they are in the repository, so you can just download them and
-- place them in the correct locations.

-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
--
--  Here are some example plugins that I've included in the Kickstart repository.
--  Uncomment any of the lines below to enable them (you will need to restart nvim).
--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.indent_line',
-- require 'kickstart.plugins.lint',
-- require 'kickstart.plugins.autopairs',
-- require 'kickstart.plugins.neo-tree',
-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
require("lazy").setup("plugins", {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

require("custom")

local function highlight(group, table)
	local fg = table.fg and table.fg or "NONE"
	local bg = table.bg and table.bg or "NONE"
	local style = table.gui and table.gui or "NONE"

	local cmd = "highlight! " .. group .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. style
	vim.cmd(cmd)
end

vim.cmd.colorscheme("gruvbuddy")
vim.cmd("highlight! TreesitterContext guibg=#111111")

if vim.g.colors_name == "catppuccin-macchiato" then
	local colors = require("catppuccin.palettes.macchiato")

	local groups = {
		-- General
		["@lsp.type"] = { fg = colors.teal },
		["@type"] = { fg = colors.teal },
		["@lsp.type.interface"] = { fg = colors.yellow },
		["@type.interface"] = { fg = colors.yellow },
		["@type.builtin"] = { fg = colors.mauve },
		["@variable.parameter"] = { fg = colors.flamingo },
		["@parameter"] = { fg = colors.flamingo },
		["@function.macro"] = { fg = colors.yellow },
		["@module"] = { fg = colors.peach },

		-- CPP configuration
		["@lsp.type.macro.cpp"] = { fg = colors.yellow },
		["@keyword.import.cpp"] = { fg = colors.peach },
		["@lsp.typemod.function.defaultLibrary.c"] = { fg = colors.text },
		["@type.builtin.c"] = { fg = colors.mauve },

		-- PYTHON configuration
		["@variable.member.python"] = { fg = colors.text },
		["@attribute.python"] = { fg = colors.yellow },
		["@attribute.builtin.python"] = { fg = colors.yellow },
		["@function.builtin.python"] = { fg = colors.sapphire },
		["@keyword.operator.python"] = { fg = colors.mauve },
		["@type.builtin.python"] = { fg = colors.yellow },
		["@variable.builtin.python"] = { fg = colors.red },
		["@string.documentation.python"] = { fg = colors.green },
		["@constructor.python"] = { fg = colors.teal },

		-- Ruby configuration
		["@lsp.type.namespace.ruby"] = { fg = colors.teal },
		["@lsp.type.class.ruby"] = { fg = colors.teal },
		["@lsp.type.parameter.ruby"] = { fg = colors.yellow },
		["@lsp.typemod.class.declaration.ruby"] = { fg = colors.teal },
		["rubyConstant"] = { fg = colors.peach },
		-- ["@variable.member.ruby"] = { fg = colors.red },
		["@variable.parameter.ruby"] = { fg = colors.yellow },

		-- Javascript config
		["@lsp.type.member.javascript"] = { fg = colors.blue },

		-- Rust config
		["@lsp.type.decorator.rust"] = { fg = colors.yellow },
		["@lsp.type.macro.rust"] = { fg = colors.blue },
		["@lsp.typemod.enumMember.defaultLibrary.rust"] = { fg = colors.sky },
		["@lsp.typemod.method.defaultLibrary.rust"] = { fg = colors.sapphire },
		["@lsp.typemod.function.defaultLibrary.rust"] = { fg = colors.sapphire },
		["@lsp.mod.attribute.rust"] = { fg = colors.yellow },
		["@lsp.type.procMacro.rust"] = { fg = colors.yellow },
		["@lsp.type.deriveHelper.rust"] = { fg = colors.yellow },
		["@lsp.type.attributeBracket.rust"] = { fg = colors.yellow },
		["@lsp.typemod.macro.defaultLibrary.rust"] = { fg = colors.yellow },
	}

	for key, value in pairs(groups) do
		highlight(key, value)
	end
end

if vim.g.colors_name == "gruvbuddy2" then
	local colors = require("colorbuddy").colors
	local Group = require("colorbuddy").Group
	local Color = require("colorbuddy").Color

	Color.new("background", "#282828")
	Color.new("gray0", "#1e1F22")

	-- Color.new("skyblue", "#56A8F5")
	Color.new("skyblue", "#81A2BE")
	Color.new("codeyellow", "#DCE775")
	Color.new("fleetpink", "#ff69b4")
	Color.new("superwhite", "#E8FFF1")
	Color.new("green", "#6AAB73")

	-- General config
	Group.new("@function", colors.codeyellow:light(), nil, nil)
	Group.new("Function", colors.codeyellow:light(), nil, nil)
	Group.new("TreesitterContext", colors.background, nil, nil)
	Group.new("@keyword", colors.green:light(), nil, nil)
	Group.new("Special", colors.green:light(), nil, nil)
	Group.new("String", colors.fleetpink:light(), nil, nil)
	Group.new("@lsp.type", colors.skyblue:light(), nil, nil)
	Group.new("@type", colors.skyblue:light(), nil, nil)
	Group.new("Type", colors.skyblue:light(), nil, nil)
	Group.new("@type.builtin", colors.green:light(), nil, nil)
	Group.new("@variable.builtin", colors.red:light(), nil, nil)
	Group.new("@variable.member", colors.blue:light():light(), nil, nil)
	Group.new("@property", colors.blue:light():light(), nil, nil)

	-- Lua
	Group.new("@function.call.lua", colors.codeyellow:light(), nil, nil)

	-- Ruby conf
	Group.new("rubyMethodName", colors.codeyellow:light(), nil, nil)
	Group.new("rubyAttribute", colors.orange:light(), nil, nil)
	Group.new("rubySymbol", colors.orange:light(), nil, nil)
	Group.new("Constant", colors.orange, nil, nil)
	Group.new("@variable.parameter.ruby", colors.red:light(), nil, nil)
	Group.new("@string.special.symbol.ruby", colors.orange:light(), nil, nil)

	-- Python config
	Group.new("@constructor.python", colors.skyblue:light(), nil, nil)
	Group.new("@variable.parameter.python", colors.orange:light(), nil, nil)
	Group.new("PreProc", colors.purple:dark(), nil, nil)
	Group.new("@attribute.builtin.python", colors.purple:dark(), nil, nil)
	Group.new("@variable.member.python", colors.blue:light():light(), nil, nil)

	-- Ocaml config
	Group.new("@lsp.type.namespace.ocaml", colors.blue, nil, nil)
	Group.new("@lsp.type.enumMember.ocaml", colors.purple, nil, nil)

	-- C/C++ config
	Group.new("@function.call.c", colors.superwhite, nil, nil)
	Group.new("@function.call.cpp", colors.superwhite, nil, nil)
	Group.new("@function.macro.c", colors.purple, nil, nil)
	Group.new("@function.macro.cpp", colors.purple, nil, nil)
	Group.new("@constructor.cpp", colors.purple, nil, nil)
	Group.new("@module.cpp", colors.red:light(), nil, nil)
	Group.new("@constant.cpp", colors.purple:dark(), nil, nil)
end

if vim.g.colors_name == "gruvbuddy" then
	local colorbuddy = require("colorbuddy")
	colorbuddy.colorscheme("gruvbuddy")
	local colors = colorbuddy.colors
	local Group = colorbuddy.Group
	local Color = colorbuddy.Color
	local g = colorbuddy.groups

	Color.new("background", "#282828")
	Color.new("gray0", "#181818")
	Color.new("vscodeblue", "#4EC9B0")
	Color.new("magenta", "#BDAFE5")
	Color.new("interface", "#B8D7A3")

	-- Group.new("@attribute.python", colors.magenta, nil, nil)
	-- NOTE: a note
	vim.cmd("hi! link @attribute.python TodoFgNOTE")
	vim.cmd("hi! link @attribute.builtin.python TodoFgNOTE")
	Group.new("Repeat", g.Include, nil, nil)
	-- Group.new("@keyword.return", g.Include, nil, nil)
	Group.new("Conditional", g.Include, nil, nil)
	Group.new("@function", colors.lightyellow, nil, nil)
	Group.new("Function", colors.lightyellow, nil, nil)
	Group.new("TreesitterContext", colors.background, nil, nil)
	Group.new("Type", colors.vscodeblue, nil, nil)
	Group.new("@type", colors.vscodeblue, nil, nil)
	Group.new("@lsp.type", colors.vscodeblue, nil, nil)
	Group.new("@constructor", colors.vscodeblue, nil, nil)
	Group.new("@lsp.type.namespace.ocaml", colors.vscodeblue, nil, nil)
	Group.new("@type.builtin", colors.violet, nil, nil)
	Group.new("@variable.member", colors.blue, nil, nil)
	Group.new("@variable.builtin", colors.red:light():light(), nil, nil)
	Group.new("@lsp.type.enumMember.ocaml", colors.blue, nil, nil)
	-- Group.new("@keyword.directive.define", colors.magenta:light():light(), nil, nil)
	Group.new("@lsp.type.enumMember", colors.interface, nil, nil)
	Group.new("@lsp.type.enumMember.ocaml", colors.interface, nil, nil)
end

local lsp = require("lspconfig")

lsp.clangd.setup({
	---@param client lsp.Client
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.cmd("highlight! Cursor guifg=#A6E3A1 guibg=#A6E3A1")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.keymap.set(
	"n",
	"<space>k",
	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
	{ noremap = true, silent = true }
)
