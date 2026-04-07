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

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
end

-- Support logo-key shortcuts in environments that forward <D-...> to Neovim.
set({ "i", "n", "s", "x" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
set("n", "<D-c>", '"+yy', { desc = "Copy Line" })
set("v", "<D-c>", '"+y', { desc = "Copy" })
set("n", "<D-v>", '"+P', { desc = "Paste" })
set("v", "<D-v>", '"+P', { desc = "Paste" })
set("c", "<D-v>", "<C-R>+", { desc = "Paste" })
set("i", "<D-v>", "<C-r>+", { desc = "Paste" })
set("t", "<D-v>", "<C-R>+", { desc = "Paste" })
