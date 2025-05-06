local wezterm = require("wezterm")
local config = {}

config.color_scheme_dirs = { "/colors" }
config.color_scheme = "Kanagawa (Gogh)"
config.font = wezterm.font({
	weight = "Regular",
	family = "CommitMono",
})

config.font_size = 12
config.enable_tab_bar = false

return config
