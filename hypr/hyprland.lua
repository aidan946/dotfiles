------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "DP-1",
	mode = "3440x1440@144.001",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "DP-2",
	mode = "1920x1080@239.761",
	position = "auto",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "dolphin"
local browser = "zen-browser"
local menu = "vicinae toggle"
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd('bash -c "wl-paste --watch cliphist store &"')
	hl.exec_cmd('bash -c "/usr/lib/polkit-kde-authentication-agent-1 &"')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

local primary = "rgba(707070ff)"
local outline = "rgba(d0d0d0ff)"
local errorColor = "rgb(ffb4ab)"

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = primary,
			inactive_border = outline,
		},
		resize_on_border = false,
		allow_tearing = true,
		layout = "scrolling",
	},

	group = {
		col = {
			border_active = primary,
			border_inactive = outline,
			border_locked_active = errorColor,
			border_locked_inactive = outline,
		},
		groupbar = {
			col = {
				active = primary,
				inactive = outline,
				locked_active = errorColor,
				locked_inactive = outline,
			},
		},
	},

	decoration = {
		rounding = 12,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 30,
			render_power = 5,
			offset = { 0, 5 },
			color = "rgba(00000070)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	scrolling = {
		explicit_column_widths = "0.333, 0.5, 0.667",
		follow_min_visible = 0.3,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "au",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		repeat_rate = 50,
		repeat_delay = 200,
		follow_mouse = 1,
		accel_profile = "flat",
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call settings toggle"))

hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))

hl.bind("SUPER + j", hl.dsp.layout("focus down"))
hl.bind("SUPER + k", hl.dsp.layout("focus up"))
hl.bind("SUPER + h", hl.dsp.layout("focus left"))
hl.bind("SUPER + l", hl.dsp.layout("focus right"))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("swapcol r"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + r", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + f", hl.dsp.layout("colresize 1.0"))

hl.bind(mainMod .. " + SUPER + P", hl.dsp.dpms({ action = "disable" }))

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume increase"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume decrease"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteOutput"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteInput"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness increase"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call media playPause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call media playPause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call media previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "zen-pip-float",
	float = true,
	pin = true,
	match = { title = "Picture-in-Picture" },
})

hl.layer_rule({
	name = "noctalia",
	match = { namespace = "noctalia-background-.*$" },
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.layer_rule({
	name = "vicinae-blur",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "vicinae" },
})

hl.layer_rule({
	name = "vicinae-no-animation",
	no_anim = true,
	match = { namespace = "vicinae" },
})

-- For Noctalia Color templates
require("noctalia")
