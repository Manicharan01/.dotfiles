local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("MesloLGS Nerd Font")
config.color_scheme = "Catppuccin Mocha"
config.term = "screen-256color"
config.force_reverse_video_cursor = true
config.enable_tab_bar = false

return config
