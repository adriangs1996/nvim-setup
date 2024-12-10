return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	opts = {
		transparent_background = true,
		term_colors = true,
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.50,
		},
		integrations = {
			bufferline = false,
		},
	},
	init = function()
		require("catppuccin").setup({
			integrations = {
				telescope = {
					style = "nvchad",
					enabled = true,
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		})
	end,
}
