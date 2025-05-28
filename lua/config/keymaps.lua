-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "[S]ave file" })
vim.keymap.set("n", "<leader>fS", ":w<CR>", { desc = "[S]ave file" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
