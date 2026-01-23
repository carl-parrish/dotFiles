local wezterm = require("wezterm")
local dimmer = { brightness = 0.1 }
local config = {}

-- =========================================================
-- 1. OS & PATH DETECTION
-- =========================================================
local is_mac = wezterm.target_triple:find("darwin")
local is_linux = wezterm.target_triple:find("linux")

-- Dynamic Home Directory
local home_dir = os.getenv("HOME") or wezterm.home_dir

-- Define Shell Paths based on OS
local fish_bin
local nu_bin

if is_mac then
	-- macOS Paths (Apple Silicon)
	fish_bin = "/opt/homebrew/bin/fish"
	nu_bin = "/opt/homebrew/bin/nu"

	-- Launch Command
	config.default_prog = { "arch", "-arm64", fish_bin, "-l" }
elseif is_linux then
	-- Linux Paths (Mint)
	fish_bin = "/usr/bin/fish" -- Standard apt install location
	nu_bin = home_dir .. "/.cargo/bin/nu" -- Your cargo install location

	-- Launch Command
	config.default_prog = { fish_bin, "-l" }
end

config.default_domain = "fish_domain"
config.term = "wezterm"
config.colors = { foreground = "yellow" }

-- =========================================================
-- 2. HELPER FUNCTIONS
-- =========================================================
local function get_effective_path()
	local path_value
	if type(os.getenv) == "function" then
		path_value = os.getenv("PATH")
	end

	-- Fallback for safety
	if not path_value or path_value == "" then
		if is_windows then
			path_value = wezterm.getenv("SystemRoot") .. "\\System32"
		else
			path_value = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
		end
	end
	return path_value
end

local function get_image_path(filename)
	-- Dynamically builds path: $HOME/.config/wezterm/images/filename
	return home_dir .. "/.config/wezterm/images/" .. filename
end

-- =========================================================
-- 3. DOMAINS
-- =========================================================
config.exec_domains = {
	wezterm.exec_domain("fish_domain", function(domain_name)
		local effective_path = get_effective_path()
		return {
			-- Use the variable we defined at the top
			args = { fish_bin, "-l" },
			label = "Fish Domain",
			gui_config_overrides = {
				colors = { background = "navy" },
			},
			set_environment_variables = {
				PATH = effective_path,
				HOME = home_dir,
				USER = wezterm.effective_user_name,
				SHELL = fish_bin, -- Uses dynamic path
				TERM = "wezterm",
			},
		}
	end),

	wezterm.exec_domain("nushell_domain", function(domain_name)
		local effective_path = get_effective_path()
		return {
			args = { nu_bin, "-l" }, -- Uses dynamic path
			label = "Nushell Domain",
			gui_config_overrides = {
				background = {
					{
						-- Uses dynamic home dir
						source = { File = get_image_path("nuLogo.png") },
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
				PATH = effective_path,
				HOME = home_dir,
				USER = wezterm.effective_user_name,
				SHELL = nu_bin,
			},
		}
	end),
}

-- =========================================================
-- 4. EVENT HANDLERS
-- =========================================================
local function set_background_for_domain(window, pane)
	local domain_name = pane:get_domain_name()
	local overrides = {}
	local background_definition

	if domain_name == "fish_domain" then
		background_definition = {
			{
				source = { File = get_image_path("d3Logo.png") },
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
		background_definition = {
			{
				source = { File = get_image_path("nuLogo.png") },
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

	if background_definition then
		overrides.background = background_definition
		window:set_config_overrides(overrides)
	end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config_arg, hover, max_width)
	if tab.active_pane then
		set_background_for_domain(tab.active_pane:window(), tab.active_pane)
		return { { text = tab.active_pane.domain_name } }
	else
		return { { text = "wezterm" } }
	end
end)

return config
