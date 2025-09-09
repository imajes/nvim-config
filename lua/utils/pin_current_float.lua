-- :lua FloatPin()
_G.FloatPin = function()
  local float_win
  for _, w in ipairs(vim.api.nvim_list_wins()) do
    local cfg = vim.api.nvim_win_get_config(w)
    if cfg and cfg.relative and cfg.relative ~= "" then
      float_win = w
    end
  end
  if not float_win then
    vim.notify("No float to pin")
    return
  end

  local srcbuf = vim.api.nvim_win_get_buf(float_win)
  local lines = vim.api.nvim_buf_get_lines(srcbuf, 0, -1, false)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = vim.bo[srcbuf].filetype
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  local width = math.max(40, math.min(120, vim.o.columns - 8))
  local height = math.max(8, math.min(30, vim.o.lines - 6))
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    width = width,
    height = height,
    border = "single",
    style = "minimal",
    focusable = true,
    zindex = 200,
  })
  vim.keymap.set("n", "q", function()
    pcall(vim.api.nvim_win_close, win, true)
  end, { buffer = buf, nowait = true, silent = true })
  vim.notify("Pinned float opened (press q to close)")
end
