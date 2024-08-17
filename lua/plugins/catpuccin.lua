return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		require("catppuccin").setup({
			color_overrides = {
				all = {
					base = "#0b0d0f",
					mantle = "#0b0d0f",
					crust = "#0b0d0f",
				},
			},
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
