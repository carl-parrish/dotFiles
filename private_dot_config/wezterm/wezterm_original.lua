local wezterm = require("wezterm")
local dimmer = { brightness = 0.1 }
local config = {}

config.colors = { foreground = "yellow" }
config.default_prog = { "/usr/local/bin/fish", "-l" }
config.default_domain = "nushell_domain" -- You have this set to test nushell

-- Helper function to get PATH robustly
local function get_effective_path()
	local path_value
	local source_log = ""

	-- Try os.getenv first (standard Lua)
	if type(os.getenv) == "function" then
		path_value = os.getenv("PATH")
		source_log = "os.getenv('PATH')"
		wezterm.log_info("Path from " .. source_log .. ": " .. tostring(path_value))
	end

	-- Try wezterm.getenv if os.getenv didn't yield a result or wasn't a function
	if (path_value == nil or path_value == "") and (wezterm and type(wezterm.getenv) == "function") then
		path_value = wezterm.getenv("PATH")
		source_log = "wezterm.getenv('PATH')"
		wezterm.log_info("Path from " .. source_log .. ": " .. tostring(path_value))
	elseif path_value == nil or path_value == "" then
		-- Log if wezterm.getenv was not even a function
		wezterm.log_warn(
			"wezterm.getenv is not a function or wezterm module is not as expected. Type: "
				.. type(wezterm and wezterm.getenv)
		)
	end

	-- Define a sensible fallback PATH for your system
	local fallback_path = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" -- Adjust if needed for macOS specifics
	if wezterm and wezterm.target_triple_os == "Windows" then
		fallback_path = wezterm.getenv("SystemRoot") .. "\\System32;" .. wezterm.getenv("SystemRoot") .. ";" -- Simplified Windows fallback
	end

	if path_value == nil or path_value == "" then
		wezterm.log_warn(
			"PATH was nil or empty from available getenv methods. Using hardcoded fallback: "
				.. fallback_path
				.. ". (Source of attempt: "
				.. source_log
				.. ")"
		)
		return fallback_path
	else
		return path_value
	end
end

config.exec_domains = {
	wezterm.exec_domain("fish_domain", function(domain_name)
		local effective_path_fish = get_effective_path() -- Use helper
		return {
			args = { "/usr/local/bin/fish", "-l" },
			label = "Fish Domain",
			gui_config_overrides = {
				background = {
					{
						source = { File = "/Users/cparrish817/.config/wezterm/images/d3Logo.png" },
						attachment = "Fixed",
						width = "100%",
						height = "Contain",
						hsb = dimmer,
						opacity = 1,
						horizontal_align = "Center",
						vertical_align = "Middle",
						repeat_x = "NoRepeat",
						repeat_y = "NoRepeat",
					},
				},
			},
			set_environment_variables = {
				PATH = effective_path_fish,
				HOME = wezterm.home_dir,
				USER = wezterm.effective_user_name,
				SHELL = "/usr/local/bin/fish",
			},
		}
	end),

	wezterm.exec_domain("nushell_domain", function(domain_name)
		local effective_path_nushell = get_effective_path() -- Use helper
		wezterm.log_info("Nushell domain factory: effective_path determined as: " .. tostring(effective_path_nushell))

		return {
			args = { "/usr/local/bin/nu", "-l" },
			label = "Nushell Domain",
			gui_config_overrides = {
				background = {
					{
						source = { File = "/Users/cparrish817/.config/wezterm/images/nuLogo.png" },
						attachment = "Fixed",
						width = "100%",
						height = "Contain",
						hsb = dimmer,
						opacity = 1,
						horizontal_align = "Center",
						vertical_align = "Middle",
						repeat_x = "NoRepeat",
						repeat_y = "NoRepeat",
					},
					{
						source = { Gradient = { preset = "Viridis" } },
						height = "100%",
						width = "100%",
						opacity = 0.4,
					},
				},
			},
			set_environment_variables = {
				PATH = effective_path_nushell,
				HOME = wezterm.home_dir,
				USER = wezterm.effective_user_name,
				SHELL = "/usr/local/bin/nu",
			},
		}
	end),
}

-- Your set_background_for_domain function (ensure dimmer is in scope if used here, it is globally)
local function set_background_for_domain(window, pane)
	local domain_name = pane:get_domain_name()
	local overrides = {}

	if domain_name == "fish_domain" then
		overrides.background = {
			{
				source = { File = "/Users/cparrish817/.config/wezterm/images/d3Logo.png" },
				attachment = "Fixed",
				width = "100%",
				height = "Contain",
				hsb = dimmer,
				opacity = 1,
				horizontal_align = "Center",
				vertical_align = "Middle",
				repeat_x = "NoRepeat",
				repeat_y = "NoRepeat",
			},
		}
	elseif domain_name == "nushell_domain" then
		overrides.background = {
			{
				source = { File = "/Users/cparrish817/.config/wezterm/images/nuLogo.png" },
				attachment = "Fixed",
				width = "100%",
				height = "Contain",
				hsb = dimmer,
				opacity = 1,
				horizontal_align = "Center",
				vertical_align = "Middle",
				repeat_x = "NoRepeat",
				repeat_y = "NoRepeat",
			},
			{
				source = { Gradient = { preset = "Viridis" } },
				height = "100%",
				width = "100%",
				opacity = 0.4,
			},
		}
	end

	if next(overrides) ~= nil then
		window:set_config_overrides(overrides)
	end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config_arg, hover, max_width)
	if tab.active_pane then
		local title = tab.active_pane.domain_name
		set_background_for_domain(tab.active_pane:window(), tab.active_pane)
		return { { text = title } }
	else
		return { { text = "wezterm" } }
	end
end)

return config
