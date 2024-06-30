return {
	"tjdevries/colorbuddy.nvim",
	"rebelot/kanagawa.nvim",
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
				terminal_colors = true,
				devicons = true,
				styles = {},
			})
		end,
	},
}
