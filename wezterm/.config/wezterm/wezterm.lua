local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Example: Set a color scheme
config.color_scheme = "Gruvbox Dark"

-- Example: Set your favorite font
config.font = wezterm.font("FiraCode Nerd Font Propo", { weight = "Medium" })
config.font_size = 15

-- and finally, return the configuration to wezterm
return config
