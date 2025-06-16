local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.enable_input_strip = true

-- Example: Set a color scheme
-- config.color_scheme = 'Gruvbox Dark'

-- Example: Set your favorite font
config.font = wezterm.font("FiraCode Medium Nerd Font ")
config.font_size = 15

-- and finally, return the configuration to wezterm
return config
