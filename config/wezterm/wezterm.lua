local wezterm = require("wezterm")

local config = {}

config.enable_wayland = true

config.font = wezterm.font("JetbrainsMono Nerd Font Mono")
config.font_size = 16

config.color_scheme = "Tokyo Night"
config.colors = {
	tab_bar = {
		background = "#292e42",
	},
}

config.hide_tab_bar_if_only_one_tab = false

config.audible_bell = "Disabled"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

local tab_max_width = 30
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = tab_max_width
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.switch_to_last_active_tab_when_closing_tab = true

local act = wezterm.action
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-5),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(5),
	},
}

return config
