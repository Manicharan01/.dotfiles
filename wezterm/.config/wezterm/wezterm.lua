local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font({ family = "MesloLGS Nerd Font Mono", weight = "Regular", style = "Normal" })
config.color_scheme = "rose-pine"
config.term = "xterm-256color"
config.force_reverse_video_cursor = true
config.enable_tab_bar = false

return config
