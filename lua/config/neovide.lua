-- https://neovide.dev/configuration.html
--
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true

-- dark/light mode
-- vim.g.neovide_theme = "auto"

-- vim.g.neovide_cursor_vfx_mode = "railgun"

-- this is the anim which shows on buffer load etc; keep it short because it's odd
vim.g.neovide_position_animation_length = 0
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0.01

vim.g.neovide_refresh_rate = 120
-- vim.g.neovide_profiler = true

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency))
end

-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
-- vim.g.neovide_transparency = 0.0
-- vim.g.transparency = 0.9
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
