local M = {}
local applying = false

function M.apply()
  if applying then
    return
  end
  local name = vim.o.background == "light" and "dayfox" or "duskfox"
  if vim.g.colors_name == name then
    return
  end
  applying = true
  local ok, err = pcall(vim.cmd.colorscheme, name)
  applying = false
  if not ok then
    error(err)
  end
end

function M.setup()
  M.apply()
  if vim.g.neovide then
    return
  end
  local group = vim.api.nvim_create_augroup("LabTerminalAppearance", { clear = true })
  -- Neovim owns the terminal query. Its response can arrive after config loads.
  vim.api.nvim_create_autocmd("OptionSet", {
    group = group,
    pattern = "background",
    callback = M.apply,
  })
  vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter" }, {
    group = group,
    callback = function()
      vim.schedule(M.apply)
    end,
  })
end

return M
