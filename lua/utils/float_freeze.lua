-- :lua FloatFreeze()
_G.FloatFreeze = function()
  if _G._orig_win_close then
    vim.notify("Float freeze already ON")
    return
  end
  _G._orig_win_close = vim.api.nvim_win_close
  _G._orig_win_hide = vim.api.nvim_win_hide

  local function is_float(win)
    local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
    return ok and cfg and cfg.relative ~= nil and cfg.relative ~= ""
  end

  vim.api.nvim_win_close = function(win, force)
    if is_float(win) then
      return
    end
    return _G._orig_win_close(win, force)
  end

  vim.api.nvim_win_hide = function(win)
    if is_float(win) then
      return
    end
    return _G._orig_win_hide(win)
  end

  vim.notify("Float freeze: ON (press any key to release)")
  vim.schedule(function()
    vim.fn.getchar() -- waits for one keypress
    vim.api.nvim_win_close = _G._orig_win_close
    vim.api.nvim_win_hide = _G._orig_win_hide
    _G._orig_win_close, _G._orig_win_hide = nil, nil
    vim.notify("Float freeze: OFF")
  end)
end
