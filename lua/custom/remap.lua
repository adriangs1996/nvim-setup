vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
--[[ vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" }) ]]
--[[ vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" }) ]]
--[[ vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" }) ]]
--[[ vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" }) ]]

-- Configure NvimTree
-- vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeToggle, {})
-- vim.keymap.set("n", "<leader>E", ":Neotree filesystem reveal right<CR>")

-- Motion
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move down in visual mode

vim.keymap.set("n", "J", "mzJ`z") -- Mantain cursor at position when merging lines

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-y>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Configure buffers
vim.keymap.set("n", "<leader>bq", ":bd<CR>", { desc = "[Q]uit buffer" })
vim.keymap.set("n", "<leader>bqa", vim.cmd.BufferLineCloseOthers, { desc = "Close [a]ll buffers but current" })
vim.keymap.set("n", "<leader>bs", vim.cmd.BufferOrderByBufferNumber, { desc = "[S]ort buffers by buffer number" })
vim.keymap.set("n", "<leader>bn", vim.cmd.BufferLineCycleNext, { desc = "Go to [n]ext buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLineCyclePrev, { desc = "Go to [p]revious buffer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Configure Neoconf commands
vim.keymap.set("n", "<leader>cc", vim.cmd.Neoconf, { desc = "Open [C]onfiguration" })
vim.keymap.set("n", "<leader>cl", ":Neoconf lsp<CR>", { desc = "Open [L]SP Configuration for current buffer" })
vim.keymap.set("n", "<leader>cr", ":LspRestart<CR>", { desc = "[R]estart LSP for current buffer" })

vim.keymap.set("n", "<leader>fs", ":wa<CR>", { desc = "[S]ave file" })

-- Terminal utils
-- Create a remap that first splits the window vertically and then opens a terminal
-- in the new window. This is useful if you want to have a terminal open to the right
vim.keymap.set("n", "<C-t>", ":vsplit | term<CR>", { desc = "Open terminal to the [v]ertical right" })

-- Marks

local letters = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #letters do
	local letter = letters:sub(i, i)
	vim.keymap.set("n", "." .. letter, "`" .. string.upper(letter), { desc = "Jump to mark [" .. letter .. "]" })
	vim.keymap.set(
		"n",
		"m" .. letter,
		"m" .. string.upper(letter),
		{ desc = "Creates a mark as [" .. string.upper(letter) .. "]" }
	)
end
vim.keymap.set("n", "<leader>ml", ":marks<CR>", { desc = "[L]ist al marks" })

-- utils

vim.keymap.set("n", "<C-f>", "f(l", { desc = "Jump inside next ()" })
vim.keymap.set("n", "<C-a>", "<Cmd>%y+<CR>", { desc = "Copy all content" })
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
