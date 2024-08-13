local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font({ family = "MesloLGS NF", weight = "Regular" })
config.color_scheme = "rose-pine"
config.term = "xterm-256color"
config.force_reverse_video_cursor = true

return config
