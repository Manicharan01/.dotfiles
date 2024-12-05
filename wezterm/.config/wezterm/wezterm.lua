local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.term = "alacritty"
config.force_reverse_video_cursor = true
config.enable_tab_bar = false
config.window_padding = {
    top = 8,
    right = 8,
    bottom = 8,
    left = 8,
}
config.enable_wayland = true
config.color_scheme = 'Default Dark (base16)'
config.bold_brightens_ansi_colors = true
config.window_background_opacity = 0.9

return config
