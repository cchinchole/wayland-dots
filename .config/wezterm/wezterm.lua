local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Darcula (base16)'
--config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })
config.font = wezterm.font 'Iosevka Nerd Font'
config.font_size = 36

config.enable_wayland = true
config.show_tabs_in_tab_bar = false
config.enable_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.max_fps = 160

config.window_frame = {
    font_size = 18,
    active_titlebar_bg = '#000000',
    inactive_titlebar_bg = '#000000'
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = '#000000',
  },
}
return config
