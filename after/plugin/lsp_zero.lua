require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"eslint",
		"rust_analyzer",
		"ansiblels",
		"bashls",
		"clangd",
		"dockerls",
		"emmet_ls",
		"pyright",
		"ruff",
		"lua_ls",
	},
})
