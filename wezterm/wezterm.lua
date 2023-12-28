-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- colors

config.colors = {
	-- background = "#00110f",
	-- background = "#000e0f",
	-- background = "#000d0d",
	background = "#000d0b",
}
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_background_opacity = 0.75
-- config.window_background_opacity = 1.0
config.text_background_opacity = 0.9
config.window_close_confirmation = "AlwaysPrompt"
config.window_decorations = "RESIZE"
config.scrollback_lines = 3000
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.8,
}
--
-- This is where you actually apply your config choices
config.window_padding = {
	left = 2, -- Ajusta según tus preferencias
	right = 0,
	top = 0,
	bottom = 0,
}
-- For example, changing the color scheme:
config.color_scheme = "Solarized Dark - Patched"
-- config.font = wezterm.font("Iosevka Nerd Font")

config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font", scale = 1.1, weight = "Medium" },
	{ family = "Hack Nerd Font", scale = 1.2 },
})

-- keymasp
config.leader = { key = "t", mods = "CTRL", timeout_millseconds = 1000 }
config.keys = {
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
}
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end
config.key_tables = {

	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}
-- and finally, return the configuration to wezterm
return config
