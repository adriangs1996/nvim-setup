function f(str)
	local outer_env = _ENV
	return (
		str:gsub("%b{}", function(block)
			local code = block:match("{(.*)}")
			local exp_env = {}
			setmetatable(exp_env, {
				__index = function(_, k)
					local stack_level = 5
					while debug.getinfo(stack_level, "") ~= nil do
						local i = 1
						repeat
							local name, value = debug.getlocal(stack_level, i)
							if name == k then
								return value
							end
							i = i + 1
						until name == nil
						stack_level = stack_level + 1
					end
					return rawget(outer_env, k)
				end,
			})
			local fn, err = load("return " .. code, "expression `" .. code .. "`", "t", exp_env)
			if fn then
				return tostring(fn())
			else
				error(err, 0)
			end
		end)
	)
end

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.opt.swapfile = false
vim.opt.backup = false

-- [[ Setting options ]]
-- See :help vim.opt
-- NOTE: You can change these options as you wish!
--  For more options, you can see :help option-list

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
--  See :help 'clipboard'
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
--  See :help 'list'
--  and :help 'listchars'
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See :help vim.keymap.set()

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
--
-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with yap in normal mode
--  See :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install lazy.nvim plugin manager ]]
--    See :help lazy.nvim.txt or https://github.com/folke/lazy.nvim for more info
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
--  You can press ? in this menu for help. Use :q to close the window
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

-- The line beneath this is called modeline. See :help modeline
-- vim: ts=2 sts=2 sw=2 et

require("custom")

local function highlight(group, table)
	local fg = table.fg and table.fg or "NONE"
	local bg = table.bg and table.bg or "NONE"
	local style = table.gui and table.gui or "NONE"

	local cmd = "highlight! " .. group .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. style
	vim.cmd(cmd)
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

local function link(group, link)
	vim.cmd("highlight! link " .. group .. " " .. link)
end

if vim.g.colors_name == "nord" then
	local palette = {
		aurora = {
			red = { fg = "#BF616A" },
			orange = { fg = "#D08770" },
			yellow = { fg = "#EBCB8B" },
			green = { fg = "#A3BE8C" },
			purple = { fg = "#B48EAD" },
			pink = { fg = "#C77DBB" },
			lightred = { fg = "#EBA0AC" },
		},

		snowstorm = {
			white = { fg = "#D8DEE9" },
			gray = { fg = "#4C566A" },
			black = { fg = "#2E3440" },
		},

		frost = {
			blue = { fg = "#5E81AC" },
			cyan = { fg = "#88C0D0" },
			teal = { fg = "#8FBCBB" },
			lightblue = { fg = "#81A1C1" },
		},
	}

	local groups = {
		["@type"] = palette.frost.teal,
		["@constructor"] = palette.frost.teal,
		["Type"] = palette.frost.teal,
		["@lsp.type"] = palette.frost.teal,
		["@lsp.typemod.class.declaration"] = palette.frost.teal,
		["@lsp.type.namespace.ruby"] = palette.frost.teal,

		["@attribute"] = palette.aurora.orange,
		["@attribute.builtin"] = palette.aurora.orange,
		["@string.special.symbol.ruby"] = palette.aurora.orange,

		["@variable.builtin"] = palette.aurora.yellow,
		["@type.builtin"] = palette.aurora.yellow,
		["@function.builtin"] = palette.aurora.yellow,
		["@keyword.modifier.ruby"] = palette.aurora.yellow,

		["@property"] = palette.frost.blue,
		["@variable.parameter"] = palette.aurora.lightred,
		["@lsp.mod.defaultLibrary"] = palette.aurora.lightred,

		["@tag"] = palette.frost.cyan,
		["Tag"] = palette.frost.cyan,
	}

	for group, colors in pairs(groups) do
		highlight(group, colors)
	end

	link("@keyword.function", "@keyword")
end

vim.cmd.colorscheme("kanagawa")
if vim.g.colors_name == "kanagawa" then
	local colors = require("kanagawa.colors").setup({ theme = "wave" }).palette
	local theme = {
		dragon = {
			red = { fg = colors.dragonRed },
			teal = { fg = colors.dragonTeal },
			violet = { fg = colors.dragonViolet },
			lightblue = { fg = colors.dragonAqua },
			testblue = { fg = "#499EFF" },
		},
		wave = {
			warmwhite = { fg = colors.fujiWhite },
			darkwhite = { fg = colors.oldWhite },
			green = { fg = colors.autumnGreen },
			lightgreen = { fg = colors.springGreen },
			blue = { fg = colors.crystalBlue },
			lightblue = { fg = colors.springBlue },
			teal = { fg = colors.waveAqua2 },
			yellow = { fg = colors.boatYellow2 },
			lightyellow = { fg = colors.carpYellow },
			orange = { fg = colors.surimiOrange },
			red = { fg = colors.peachRed },
			softred = { fg = colors.waveRed },
			pink = { fg = colors.sakuraPink },
			violet = { fg = colors.oniViolet },
			purple = { fg = colors.oniViolet2 },
		},

		dp = {
			lightgreen = { fg = "#8aff80" },
			teal = { fg = "#80ffea" },
			grayblue = { fg = "#658594" },
			softyellow = { fg = "#ffca80", gui = "italic" },
		},
	}

	local groups = {
		["@variable"] = theme.wave.warmwhite,

		["@type"] = theme.dp.teal,
		["Type"] = theme.dp.teal,
		["@constructor"] = theme.dp.teal,
		["@type.builtin"] = theme.wave.softred,

		["@attribute"] = theme.wave.orange,
		["@attribute.builtin"] = theme.wave.orange,
		["@attribute.python"] = theme.wave.orange,
		["@attribute.builtin.python"] = theme.wave.orange,

		["@variable.builtin"] = theme.wave.softred,
		["@function.builtin"] = theme.wave.violet,

		["Identifier"] = theme.dragon.violet,
		["@variable.member"] = theme.dragon.violet,
		["@property"] = theme.dragon.violet,
		["Function"] = theme.dp.lightgreen,
		["Keyword"] = theme.wave.softred,
		["@keyword.operator"] = theme.wave.softred,
		["String"] = theme.wave.pink,
		["@keyword.return"] = theme.wave.softred,
		["@keyword.exception"] = theme.wave.softred,

		["Special"] = theme.wave.pink,
		["@variable.parameter"] = theme.dp.softyellow,
	}

	for group, colors in pairs(groups) do
		highlight(group, colors)
	end
end

if vim.g.colors_name == "gruvbuddy" then
	local colorbuddy = require("colorbuddy")
	colorbuddy.colorscheme("gruvbuddy")
	local colors = colorbuddy.colors
	local Group = colorbuddy.Group
	local Color = colorbuddy.Color
	local g = colorbuddy.groups
	local s = colorbuddy.styles

	-- Color.new("background", "#282828")
	-- Color.new("gray0", "#131313")
	Color.new("vscodeblue", "#4EC9B0")
	-- Color.new("mgreen", "#4EC9B0")
	Color.new("magenta", "#BDAFE5")
	Color.new("interface", "#B8D7A3")
	Color.new("mpurple", "#AA22FF")
	Color.new("mblue", "#66C3CC")
	-- Color.new("mgreen", "#008000")
	Color.new("mgreen", "#6CC050")
	Color.new("mbrown", "#C9A26D")
	Color.new("mpink", "#ED94C0")
	Color.new("mmidpink", "#E1BFFF")
	Color.new("mbluedark", "#0000FF")
	Color.new("mred", "#BC2121")

	Group.new("Include", colors.mgreen, nil, nil)
	Group.new("Repeat", colors.mgreen, nil, nil)
	Group.new("@string.special.symbol.ruby", colors.mpurple, nil, s.italic)
	Group.new("rubySymbol", colors.mpink, nil, s.none)
	Group.new("@tag", colors.mgreen, nil, nil)
	Group.new("Tag", colors.mgreen, nil, nil)
	Group.new("Keyword", colors.mgreen, nil, nil)
	Group.new("@keyword", colors.mgreen, nil, nil)
	Group.new("@keyword.modifier.ruby", colors.lightyellow, nil, nil)
	Group.new("@type.builtin", colors.mgreen, nil, nil)
	Group.new("@type.builtin.python", colors.mgreen, nil, nil)
	Group.new("@variable.member", colors.superwhite, nil, nil)
	Group.new("@variable.builtin.python", colors.mgreen, nil, nil)
	Group.new("@property", colors.superwhite, nil, nil)
	Group.new("@function", colors.mbluedark, nil, nil)
	Group.new("Function", colors.mbluedark, nil, nil)
	Group.new("String", colors.mred:dark(), nil, nil)
	Group.new("Type", colors.mpurple:light(), nil, nil)
	Group.new("@type", colors.mpurple:light(), nil, nil)
	Group.new("@lsp.type", colors.mpurple:light(), nil, nil)
	Group.new("@constructor", colors.mpurple:light(), nil, nil)
	-- Group.new("@constructor.python", colors.vscodeblue, nil, nil)
	Group.new("@lsp.type.namespace.ocaml", colors.mpurple, nil, nil)
	Group.new("@attribute.builtin.python", colors.lightyellow, nil, nil)
	Group.new("@attribute.python", colors.lightyellow, nil, nil)
	Group.new("@attribute.builtin", colors.lightyellow, nil, nil)
	Group.new("@attribute", colors.lightyellow, nil, nil)
	Group.new("@variable.parameter", colors.orange:light(), nil, nil)
	Group.new("@module", colors.blue:light(), nil, nil)
	Group.new("@keyword.import.cpp", colors.lightyellow, nil, nil)
	Group.new("@keyword.import.c", colors.lightyellow, nil, nil)
	Group.new("@function.macro.c", colors.lightyellow, nil, nil)
	Group.new("@function.macro.cpp", colors.lightyellow, nil, nil)

	Group.new("TreesitterContext", colors.background, nil, nil)
	Group.new("@variable.builtin", colors.red:light(), nil, nil)
	Group.new("@lsp.type.enumMember.ocaml", colors.interface, nil, nil)
	Group.new("@lsp.type.enumMember", colors.interface, nil, nil)
	Group.new("@lsp.type.enumMember.ocaml", colors.interface, nil, nil)
end
