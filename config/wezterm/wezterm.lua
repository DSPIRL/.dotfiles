local wezterm = require 'wezterm'
local config = {}

-- Blue/Purple themes
-- config.color_scheme = 'Dark Violet (base16)'
-- config.color_scheme = 'VisiBlue (terminal.sexy)'
-- Pastel themes
-- config.color_scheme = 'WildCherry'
-- config.color_scheme = 'Urple'
-- config.color_scheme = 'Wryan'
-- config.color_scheme = 'zenwritten_dark'
-- Vibrant themes
-- config.color_scheme = 'deep'
-- config.color_scheme = 'Windows NT (base16)'
-- config.color_scheme = 'Unikitty Reversible (base16)'
-- config.color_scheme = 'Horizon Dark (Gogh)'
-- config.color_scheme = 'Vice Dark (base16)'
-- config.color_scheme = 'XCode Dusk (base16)'
-- config.color_scheme = ''

config.window_decorations = 'RESIZE'
config.enable_tab_bar = false

config.window_background_opacity = 0.8
config.macos_window_background_blur = 40
config.anti_alias_custom_block_glyphs = true
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14

config.initial_cols = 150
config.initial_rows = 50

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}




-- config.window_background_image = "Users/raphi/.config/wezterm/painted.jpg"
-- config.window_background_image_hsb = {
-- 	brightness = 0.01
-- }






---- Window configuration
-- config.window_frame = {
--   inactive_titlebar_bg = '#353535',
--   active_titlebar_bg = '#2b2042',
--   inactive_titlebar_fg = '#cccccc',
--   active_titlebar_fg = '#ffffff',
--   inactive_titlebar_border_bottom = '#2b2042',
--   active_titlebar_border_bottom = '#2b2042',
--   button_fg = '#cccccc',
--   button_bg = '#2b2042',
--   button_hover_fg = '#ffffff',
--   button_hover_bg = '#3b3052',
-- }

---- More window configuration
-- config.window_frame = {
--   border_left_width = '0.5cell',
--   border_right_width = '0.5cell',
--   border_bottom_height = '0.25cell',
--   border_top_height = '0.25cell',
--   border_left_color = 'purple',
--   border_right_color = 'purple',
--   border_bottom_color = 'purple',
--   border_top_color = 'purple',
-- }
--

return config