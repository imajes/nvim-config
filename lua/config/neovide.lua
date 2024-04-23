-- https://neovide.dev/configuration.html
--
-- Note, some of these settings are now in ~/.config/neovide/config.toml
--
-- vim.o.guifont = "SauceCodePro NF Light:h18:#h-slight:#e-subpixelantialias"
-- vim.o.guifont = "Fira Code Light:h18:#h-slight:#e-subpixelantialias"
-- https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets
-- vim.g.neovide_font_features = { "zero", "cv02", "cv01", "ss01", "cv14", "ss08", "cv24", "ss06", "cv27", "ss07" },
-- a g 0 /= <= >= != -> <- => := ... ++ -- :: // ** /* */ << >> && || ?? ::= \\ [] {. .} =~

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = -5

vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true

-- dark/light mode
vim.g.neovide_theme = "auto"

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
