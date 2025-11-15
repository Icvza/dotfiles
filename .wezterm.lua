local wezterm = require("wezterm")
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

local config = wezterm.config_builder()

local act = wezterm.action

-- Your existing appearance functions
-- local function get_appearance()
-- 	if wezterm.gui then
-- 		return wezterm.gui.get_appearance()
-- 	end
-- 	return "Dark"
-- end

-- local function scheme_for_appearance(appearance)
-- 	if appearance:find("Dark") then
-- 		return "Tokyo Night"
-- 	else
-- 		return "Tokyo Night Day"
-- 	end
-- end

-- Add system appearance change detection and Neovim sync
-- wezterm.on("window-config-reloaded", function(window)
-- 	local appearance = get_appearance()
-- 	-- Send the appearance change to Neovim
-- 	local panes = window:mux_window():panes()
-- 	for _, pane in ipairs(panes) do
-- 		-- Check if the pane is running Neovim
-- 		local process_name = pane:get_foreground_process_name()
-- 		if process_name and process_name:find("n?vim") then
-- 			local mode = appearance:find("Dark") and "dark" or "light"
-- 			pane:spawn({
-- 				args = { "bash", "-c", string.format("nvim --remote-send ':lua SetSystemTheme(\"%s\")<CR>'", mode) },
-- 			})
-- 		end
-- 	end
-- end)

config.color_scheme = "Kanagawa (Gogh)"

-- Neovim Configuration (init.lua)
-- function SetSystemTheme(mode)
-- 	if mode == "dark" then
-- 		vim.cmd("colorscheme tokyonight-night")
-- 		vim.opt.background = "dark"
-- 		vim.opt.transparent = true
-- 	else
-- 		vim.cmd("colorscheme tokyonight-day")
-- 		vim.opt.background = "light"
-- 		vim.opt.transparent = false
-- 	end
-- end

config.max_fps = 240
config.colors = {
	-- 	foreground = "#CBE0F0",
	-- background = "#0A0A0A",
	cursor_bg = "#E52E2E",
	-- cursor_border = "#47FF9C",
	-- 	cursor_fg = "#011423",
	-- 	selection_bg = "#706b4e",
	-- 	selection_fg = "#f3d9c4",
	-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	tab_bar = {
		background = "rgba(0,0,0,0)",
		--
		-- 		active_tab = {
		-- 			bg_color = "#47FF9C",
		-- 			fg_color = "#011423",
		-- 			intensity = "Bold",
		-- 			underline = "None",
		-- 			italic = true,
		-- 			strikethrough = false,
		-- 		},
		--
		-- 		inactive_tab = {
		-- 			bg_color = "#214969",
		-- 			fg_color = "#CBE0F0",
		-- 			intensity = "Normal",
		-- 			underline = "None",
		-- 			italic = false,
		-- 			strikethrough = false,
		-- 		},
		--
		-- 		inactive_tab_hover = {
		-- 			bg_color = "#44FFB1",
		-- 			fg_color = "#011423",
		-- 			intensity = "Normal",
		-- 			underline = "None",
		-- 			italic = true,
		-- 			strikethrough = false,
		-- 		},
		--
		-- 		new_tab = {
		-- 			bg_color = "#214969",
		-- 			fg_color = "#CBE0F0",
		-- 			intensity = "Normal",
		-- 			underline = "None",
		-- 			italic = false,
		-- 			strikethrough = false,
		-- 		},
		--
		-- 		new_tab_hover = {
		-- 			bg_color = "#44FFB1",
		-- 			fg_color = "#011423",
		-- 			intensity = "Normal",
		-- 			underline = "None",
		-- 			italic = true,
		-- 			strikethrough = false,
		-- 		},
	},
}

-- config.dpi_by_screen = {
-- 	["Built-in Retina Display"] = 144,
-- 	["LG HDR WQHD"] = 109,
-- }

config.tab_max_width = 9000
config.font = wezterm.font("JetBrains Mono")
config.font_size = 21
-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 3500

-- Tab bar
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 59
config.tab_bar_at_bottom = true

-- diable close confirmation
config.window_close_confirmation = "NeverPrompt"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.24,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Keys
config.keys = {
	-- Send C-a when pressing C-a twice
	-- { key = "a", mods = "CTRL|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	-- {
	-- 	key = "h",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.SendString("\x1bh"),
	-- },
	-- {
	-- 	key = "i",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.SendString("\x1bi"),
	-- },
	-- Pane keybindings
	{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "OPT|CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "DownArrow", mods = "OPT|CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "OPT|CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "RightArrow", mods = "OPT|CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "o", mods = "CTRL", action = act.RotatePanes("Clockwise") },
	{ mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	--mini term
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action_callback(function(_, pane)
			local tab = pane:tab()
			local panes = tab:panes_with_info()
			if #panes == 1 then
				pane:split({
					direction = "Right",
					size = 0.4,
				})
			elseif not panes[1].is_zoomed then
				panes[1].pane:activate()
				tab:set_zoomed(true)
			elseif panes[1].is_zoomed then
				tab:set_zoomed(false)
				panes[2].pane:activate()
			end
		end),
	},

	-- Tab keybindings
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{
		key = "e",
		mods = "CTRL",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "CTRL", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
}

local function tab_title(tab_info)
	-- First check the explicit tab title, then fall back to pane title
	local title = tab_info.tab_title and #tab_info.tab_title > 0 and tab_info.tab_title or tab_info.active_pane.title

	-- Special case: if this is the main supersonic-frontend repo, keep the full name
	if title == "supersonic-frontend" then
		return title
	end

	-- For all other cases, remove the -supersonic-frontend suffix if present
	title = string.gsub(title, "%-supersonic%-frontend$", "")

	-- If the title is a path, take the last component
	local last_component = string.match(title, "[^/]+$")
	return last_component or title
end

-- Function to truncate the title if it's too long
local function truncate_title(title, max_length)
	if #title > max_length then
		return title:sub(1, max_length - 3) .. "..."
	end
	return title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "rgba(0,0,0,0)"
	local background = "#223249" -- Darker blue from Kanagawa
	local foreground = "#DCD7BA" -- Light text color from Kanagawa

	if tab.is_active then
		background = "#76946A" -- Soft green from Kanagawa
		foreground = "#1F1F28" -- Dark background color from Kanagawa
	elseif hover then
		background = "#98BB6C" -- Brighter green from Kanagawa
		foreground = "#1F1F28" -- Dark background color from Kanagawa
	else
		-- Change the background and foreground based on the tab index
		local colors = {
			"#7E9CD8", -- Blue from Kanagawa
			"#957FB8", -- Purple from Kanagawa
			"#76946A", -- Green from Kanagawa
			"#DCA561", -- Orange/gold from Kanagawa
			"#E82424", -- Red from Kanagawa
			"#7FB4CA", -- Light blue from Kanagawa
			"#7E9CD8", -- Blue (repeat) from Kanagawa
			"#957FB8", -- Purple (repeat) from Kanagawa
			"#76946A", -- Green (repeat) from Kanagawa
			"#DCA561", -- Orange/gold (repeat) from Kanagawa
		}
		background = colors[tab.tab_index + 1] or "#223249"
		foreground = "#1F1F28" -- Dark background for contrast
	end

	local edge_foreground = background
	local title = tab_title(tab)
	-- Use a default title for new tabs or when the title is not set
	if title == "~" then
		title = "Home"
	end
	-- Calculate the available space for the title
	local tab_index_space = #tostring(tab.tab_index + 1) + 2 -- +2 for ": "
	local max_title_width = max_width - tab_index_space -- -4 for arrows and spaces
	-- Truncate the title if necessary
	title = truncate_title(title, max_title_width)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = string.format("%d: %s", tab.tab_index + 1, title) },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW .. " " },
	}
end)

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- and finally, return the configuration to wezterm
return config
