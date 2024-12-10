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

lsp.ruby_lsp.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

lsp.sorbet.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.cmd("highlight! Cursor guifg=#afcb85 guibg=#afcb85")

vim.keymap.set(
	"n",
	"<space>k",
	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
	{ noremap = true, silent = true }
)

if vim.g.colors_name == "fleet" then
	local palette = require("fleet-theme.palette")

	local theme = {
		red = { fg = "#F38BA8" },
		-- greenie = { fg = "#9CD785" },
		greenie = { fg = palette.palette.green },
		orange = { fg = palette.palette.orange },
		purple = { fg = palette.palette.purple },
		blue = { fg = palette.palette.light_blue },
		vscode = {
			green = "#68A67E",
		},
	}

	local groups = {
		["@attribute"] = theme.greenie,
		["@attribute.builtin"] = theme.greenie,
		["rubyModuleName"] = theme.greenie,
		["@attribute.builtin.python"] = theme.greenie,
		["@function.builtin.ruby"] = theme.greenie,
		["@constant.ruby"] = theme.greenie,
		["Special"] = theme.purple,
		["String"] = { fg = palette.palette.pink },
		["@string"] = { fg = palette.palette.pink },
		["Number"] = { fg = palette.palette.pink },
		["@function.builtin.python"] = theme.orange,

		["@variable.member.ruby"] = { fg = palette.palette.purple },
		["@variable.parameter"] = { fg = palette.palette.red },
		["@lsp.mod.defaultLibrary"] = { fg = palette.palette.red },
		["@variable.member"] = { fg = palette.palette.orange },
		["@lsp.type.property"] = { fg = palette.palette.orange },

		["@variable.builtin"] = theme.orange,
		["@constant.builtin.python"] = { fg = palette.palette.cyan },
		["@tag.builtin.tsx"] = { fg = palette.palette.cyan },
		["@variable.builtin.python"] = theme.purple,
		["@constructor.python"] = theme.blue,
		["@boolean.ruby"] = { fg = palette.palette.cyan },
		["@property.yaml"] = { fg = palette.palette.cyan },
		["@string.special.symbol.ruby"] = { fg = palette.palette.orange },
		["@function.call"] = { fg = palette.palette.light },
		["@function.method.call"] = { fg = palette.palette.light },
		["@constructor"] = { fg = palette.palette.light_blue },
		["@boolean"] = { fg = palette.palette.cyan },
		["Boolean"] = { fg = palette.palette.cyan },
		["@tag.attribute"] = { fg = palette.palette.orange },
	}

	for group, colors in pairs(groups) do
		highlight(group, colors)
	end
end

vim.cmd("colorscheme catppuccin-mocha")
if vim.g.colors_name == "catppuccin-mocha" then
	highlight("Normal", { bg = "#1e1e2e" })
	local palette = require("catppuccin.palettes.mocha")

	local groups = {
		["@variable.member.ruby"] = { fg = palette.teal },
		["@module"] = { fg = palette.teal },
		["@namespace"] = { fg = palette.teal },
		["Conditional"] = { fg = palette.sky },
		["Include"] = { fg = palette.sky },
		["@type.builtin"] = { fg = palette.sky },
		["@tag.tsx"] = { fg = palette.yellow },
	}

	for group, colors in pairs(groups) do
		highlight(group, colors)
	end
end

vim.keymap.set("n", "<C-r>", ":tabnew<CR>:DBUI<CR>")
vim.keymap.set("n", "<C-p>", ":tabp<CR>")
vim.keymap.set("n", "<C-n>", ":tabn<CR>")
