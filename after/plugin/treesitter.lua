local treesitter_config = require("nvim-treesitter.configs")
treesitter_config.setup({
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	additional_vim_regex_highlighting = false,
})
