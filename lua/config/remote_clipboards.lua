-- handles where clipboard doesn't work quite right on remote due to osc52 compat
-- https://github.com/wezterm/wezterm/issues/2050
if vim.env.SSH_TTY then
  vim.opt.clipboard = "" -- don't bind unnamed/unnamedplus
  -- explicit copy to your local clipboard via OSC52:
  vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy → system clipboard (OSC52)" })
  vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line → system clipboard" })
end
