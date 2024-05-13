return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "Move focus to the left window" }),
	vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "Move focus to the right window" }),
	vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "Move focus to the lower window" }),
	vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>", { desc = "Move focus to the upper window" }),
}
