local function append_modeline()
  local modeline = string.format(
    " vim: set ft=%s ts=%d sw=%d tw=%d %set :",
    vim.o.filetype,
    vim.o.tabstop,
    vim.o.shiftwidth,
    vim.o.textwidth,
    vim.o.expandtab and "" or "no"
  )

  modeline = vim.o.commentstring:gsub("%%s", modeline)
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
end

vim.keymap.set("n", "<Leader>ml", append_modeline, { noremap = true, silent = true, desc = "Append Modeline" })
