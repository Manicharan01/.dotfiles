local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("MesloLGS NF")
config.color_scheme = "Catppuccin Mocha"
config.term = "xterm-256color"
config.force_reverse_video_cursor = true
config.enable_tab_bar = false

return config
