-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- automatically save files on focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  command = "silent! wa",
})

-- " lose extraneous whitespace at end of lines
-- cnoreabbrev  ws %s/\s\+$//g
-- map <Leader>fm :g/^\s*$/,/\S/-j<Bar>%s/\s\+$//<CR>
--
-- " squash tabs down; (better is :retab)
-- cnoreabbrev  squash %s/\s\{4\}/  /g

-- on file save, purge trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[%s/\s\+$//e]],
})

-- local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require("go.format").goimport()
--   end,
--   group = format_sync_grp,
-- })
