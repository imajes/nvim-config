local function append_modeline()
  local buf = 0
  local modeline = string.format(
    " vim: set ft=%s ts=%d sw=%d tw=%d %set :",
    vim.api.nvim_get_option_value("filetype", { buf = buf }),
    vim.api.nvim_get_option_value("tabstop", { buf = buf }),
    vim.api.nvim_get_option_value("shiftwidth", { buf = buf }),
    vim.api.nvim_get_option_value("textwidth", { buf = buf }),
    vim.api.nvim_get_option_value("expandtab", { buf = buf }) and "" or "no"
  )

  modeline = vim.o.commentstring:gsub("%%s", modeline)
  vim.api.nvim_buf_set_lines(buf, -1, -1, false, { modeline })
end

vim.keymap.set("n", "<Leader>ml", append_modeline, { noremap = true, silent = true, desc = "Append Modeline" })
