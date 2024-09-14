local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font_with_fallback {
    'DejaVuSansM Nerd Font Mono',
    'Fira Code',
    'Cascadia Code',
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.2
config.default_domain = 'WSL:AlmaLinuxOS-9'

return config
