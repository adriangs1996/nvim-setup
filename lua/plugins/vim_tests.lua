return {
	"vim-test/vim-test",

	dependencies = {
		"preservim/vimux",
	},

	vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Run test nearest" }),
	vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Run test file" }),
	vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Run test suite" }),
	vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Run test last" }),
	vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Run test visit" }),

	vim.cmd("let test#strategy = 'vimux'"),
}
