vim.print("in modeline file = setup stuff")

-- Function to append modeline after the last line in the buffer.
local function append_modeline()
  local tabstop = vim.o.tabstop
  local shiftwidth = vim.o.shiftwidth
  local textwidth = vim.o.textwidth
  local expandtab = vim.o.expandtab
  local filetype = vim.o.filetype

  -- Create the modeline string.
  local modeline = string.format(
    " vim: set ft=%s ts=%d sw=%d tw=%d %set :",
    filetype,
    tabstop,
    shiftwidth,
    textwidth,
    expandtab and "" or "no"
  )

  -- Replace the placeholder in the comment string.
  local commentstring = vim.o.commentstring
  modeline = commentstring:gsub("%%s", modeline)

  -- Append the modeline after the last line in the buffer.
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
end

-- Map <Leader>ml to call the append_modeline function.
vim.keymap.set("n", "<Leader>ml", function()
  append_modeline()
end, { noremap = true, silent = true })
