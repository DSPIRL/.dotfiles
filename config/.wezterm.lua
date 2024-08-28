local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = '3024 Night (Gogh)'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13
config.window_background_image = "~/.dotfiles/config/painted.jpg"
config.window_background_image_hsb = {
	brightness = 0.01
}
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30
anti_alias_custom_block_glyphs = true

return config
