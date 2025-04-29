local wezterm = require("wezterm")
local config = {}

config.color_scheme_dirs = { "/colors" }
config.color_scheme = "tokyonight_moon"
config.font = wezterm.font({
	weight = "Light",
	family = "Iosevka Term Curly",
})

config.font_size = 12
config.enable_tab_bar = false

return config
