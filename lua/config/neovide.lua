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

-- cursor configuration
-- https://neovide.dev/configuration.html?highlight=trail#cursor-settings
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_cursor_trail_size = 0.25 -- how long the wierd trail is
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 50.0
vim.g.neovide_cursor_vfx_particle_lifetime = 2.5
vim.g.neovide_cursor_vfx_particle_density = 25.0
vim.g.neovide_cursor_vfx_particle_speed = 75.0

-- this is the anim which shows on buffer load etc; keep it short because it's odd
-- vim.g.neovide_position_animation_length = 0
-- vim.g.neovide_scroll_animation_length = 0.1
-- vim.g.neovide_cursor_animation_length = 0.01

vim.g.neovide_refresh_rate = 120

-- opacity/transparency settings
vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8

-- window blur?
vim.g.neovide_window_blurred = true

-- vim.g.neovide_profiler = true
