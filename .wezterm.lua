-- Pull in the Wezterm API
local wezterm = require 'wezterm'

-- Hold the configuration
local config = wezterm.config_builder()
local act = wezterm.action

-- Set preferred font & size
config.font = wezterm.font 'Agave Nerd Font'
config.font_size = 20

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
    left = 12,
    right = 12,
    top = 12,
    bottom = 8,
}

config.window_background_opacity = 0.86
config.macos_window_background_blur = 20

config.scrollback_lines = 10000

config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
    },
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CMD',
        action = act.OpenLinkAtMouseCursor,
    }
}

-- config.color_scheme = 'Dracula'

config.colors = {
    foreground = '#efefef',
    background = '#121517',
    cursor_bg = '#ffcb6b',
    cursor_fg = '#000000',
    cursor_border = '#f5e0dc',
    selection_bg = '#607c8a',
    selection_fg = '#eceef0',

    ansi = {
        '#546d79', '#fe5151', '#60efad', '#ffd640',
        '#40c3fe', '#fe3f80', '#64fcda', '#fffefe',
    },
    brights = {
        '#b0bdc4', '#fe897f', '#b9f5c9', '#ffe47e',
        '#80d7fe', '#fe7faa', '#a7fdeb', '#fffefe',
    },
}

return config
