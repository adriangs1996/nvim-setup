-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
local clipboard_group = vim.api.nvim_create_augroup("ClipboardCommands", { clear = true })
-- Add a keymap to copy the current file path to clipboard
vim.api.nvim_create_autocmd("BufEnter", {
  group = clipboard_group,
  pattern = "*",
  callback = function()
    vim.keymap.set("n", "<leader>cp", function()
      -- Get the full path of the current file
      local file_path = vim.fn.expand("%:p")
      -- Copy to system clipboard
      vim.fn.setreg("+", file_path)
      vim.notify("Copied to clipboard: " .. file_path, vim.log.levels.INFO)
    end, { buffer = true, desc = "Copy file path to clipboard" })

    -- Add a keymap to copy the relative file path to clipboard
    vim.keymap.set("n", "<leader>cr", function()
      -- Get the relative path of the current file
      local file_path = vim.fn.expand("%")
      -- Copy to system clipboard
      vim.fn.setreg("+", file_path)
      vim.notify("Copied to clipboard: " .. file_path, vim.log.levels.INFO)
    end, { buffer = true, desc = "Copy relative file path to clipboard" })
  end,
})
