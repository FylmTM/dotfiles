local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--config.color_scheme = 'Material Darker (base16)'
config.color_scheme = 'Galizur'
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

config.font_size = 16

config.keys = {
  {
    key = '\\',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

config.use_fancy_tab_bar = true

return config

