-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- https://neovide.dev/configuration.html
if vim.g.neovide then
  vim.o.guifont = "SauceCodePro NF Light:h18:#h-slight:#e-subpixelantialias"
  vim.g.neovide_scale_factor = 1.1
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = -5

  vim.g.neovide_remember_window_size = true

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency))
  end

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end
