return {
	"tiagovla/scope.nvim",
	config = function()
		vim.opt.sessionoptions = { -- required
			"buffers",
			"tabpages",
			"globals",
		}
		require("telescope").load_extension("scope")

		require("scope").setup({})
	end,
}
