local wezterm = require("wezterm")
local mux = wezterm.mux

-- maximize on startup
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.leader = { key = "b", mods = "CTRL" }

-- behave like tmux
require("plugins.wez-tmux.plugin").apply_to_config(config, {})

return config
