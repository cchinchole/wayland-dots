local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Darcula (base16)'
--config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })
config.font = wezterm.font 'Iosevka Nerd Font'
config.font_size = 36

config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.max_fps = 160
config.enable_tab_bar = false
config.enable_wayland = true

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
local act = wezterm.action
-- Define a leader key (optional, but useful for entering copy mode)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Keybindings
config.keys = {
  -- Enter copy mode with LEADER + [
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
}

-- Customize copy mode keybindings for scrolling with Ctrl+j/k
config.key_tables = {
  copy_mode = {
    -- Scroll up with Ctrl+k
    { key = 'k', mods = 'CTRL', action = act.CopyMode 'MoveUp' },
    -- Scroll down with Ctrl+j
    { key = 'j', mods = 'CTRL', action = act.CopyMode 'MoveDown' },
    -- Exit copy mode with Escape
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    -- Add other Vim-like bindings if desired
    { key = 'h', mods = 'CTRL', action = act.CopyMode 'MoveLeft' },
    { key = 'l', mods = 'CTRL', action = act.CopyMode 'MoveRight' },
    { key = 'b', mods = 'CTRL', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'w', mods = 'CTRL', action = act.CopyMode 'MoveForwardWord' },
  },
}

return config
