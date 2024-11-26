-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- move to beginning of line
set("i", "<C-a>", "<C-o>^", { silent = true })
-- set("i", "<C-a>", "<esc>0i", { desc = "Move to line beginning" })
set("n", "<C-a>", "0", { desc = "Move to line beginning" })

-- move to end of line
set("i", "<C-e>", "<C-o>$", { silent = true })
-- set("i", "<C-e>", "<esc>$i<right>", { desc = "Move to line end" })
set("n", "<C-e>", "$", { desc = "Move to line end" })

-- select all
set({ "i", "n", "v" }, "<D-a>", "<ESC>ggVG", { desc = "Select all" })

-- paste, copy, cut
set("i", "<C-v>", "p", { desc = "Paste" })
set("i", "<C-c>", "y", { desc = "Copy" })
set("i", "<C-x>", "y", { desc = "Cut" })

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
