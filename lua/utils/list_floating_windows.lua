-- :lua _G.list_floats()
_G.list_floats = function()
  local wins = vim.api.nvim_list_wins()
  local found = false
  for _, w in ipairs(wins) do
    local cfg = vim.api.nvim_win_get_config(w)
    if cfg and cfg.relative and cfg.relative ~= "" then
      found = true
      local b = vim.api.nvim_win_get_buf(w)
      local name = vim.api.nvim_buf_get_name(b)
      local ft = vim.api.nvim_get_option_value("filetype", { buf = b })
      print(("WIN %d  buf=%d  ft=%s  name=%s"):format(w, b, ft, name))
      print(vim.inspect(cfg))
      print(
        ("zindex=%s  focusable=%s  border=%s"):format(
          tostring(cfg.zindex),
          tostring(cfg.focusable),
          tostring(cfg.border)
        )
      )
      print("--")
    end
  end
  if not found then
    print("No floating windows right now.")
  end
end
