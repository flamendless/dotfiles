local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDark'
config.default_domain = 'WSL:Arch'
config.window_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font('JetBrains Mono')
config.font_size = 10.0

return config
