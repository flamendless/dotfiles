local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "GruvboxDark"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0

config.window_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"

return config
