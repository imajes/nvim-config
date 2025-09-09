-- :lua _G.trace_float_open_start()
_G._orig_open_win = _G._orig_open_win or vim.api.nvim_open_win
_G.trace_float_open_start = function()
  if vim.api.nvim_open_win == _G._orig_open_win then
    vim.api.nvim_open_win = function(buf, enter, config)
      -- Short trace; increase '2' to '1' for deeper detail
      vim.schedule(function()
        vim.notify("FLOAT OPENED:\n" .. debug.traceback("", 2))
      end)
      return _G._orig_open_win(buf, enter, config)
    end
    vim.notify("Tracing nvim_open_win: ON")
  else
    vim.notify("Tracing already ON")
  end
end

-- :lua _G.trace_float_open_stop()
_G.trace_float_open_stop = function()
  vim.api.nvim_open_win = _G._orig_open_win
  vim.notify("Tracing nvim_open_win: OFF")
end
