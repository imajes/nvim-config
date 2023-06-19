-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- move to beginning of line
set("i", "<C-a>", "<esc>0i", { desc = "Move to line beginning" })
set("n", "<C-a>", "0", { desc = "Move to line beginning" })

-- move to end of line
set("i", "<C-e>", "<esc>$i<right>", { desc = "Move to line end" })
set("n", "<C-e>", "$", { desc = "Move to line end" })
