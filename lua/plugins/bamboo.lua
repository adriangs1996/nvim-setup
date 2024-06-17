return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("bamboo").setup({
			term_colors = true,
			highlights = {
				["@attribute.python"] = { fg = "$green" },
				["@attribute.builtin.python"] = { fg = "$green" },
			},
		})
		require("bamboo").load()
	end,
}
