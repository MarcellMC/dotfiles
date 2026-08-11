-- Hyprland Configuration - Optimized for Development Workflow
-- This is a comprehensive Hyprland config file for coding, AI agents, and productivity
-- Refer to the wiki for more information: https://wiki.hypr.land/Configuring/
--
-- Ported from hyprland.conf (hyprlang) to Lua: since Hyprland 0.55, hyprlang is
-- deprecated in favor of Lua, and support for hyprland.conf will be removed in a
-- future release. See https://hypr.land/news/26_lua/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use - customize these as needed
local terminal       = "kitty"
local fileManager    = "kitty --class yazi -e yazi"
local fileManagerGui = "dolphin"
local menu           = "rofi -show drun"


-------------------
---- AUTOSTART ----
-------------------

-- Essential processes and your preferred apps at launch
hl.on("hyprland.start", function()
    hl.exec_cmd(terminal, { workspace = "2 silent" })
    hl.exec_cmd("waybar")                    -- Status bar
    hl.exec_cmd("mako")                      -- Notification daemon
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")  -- Authentication agent
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data

    -- Workspace apps
    hl.exec_cmd("google-chrome-stable")
    hl.exec_cmd("telegram-desktop")
    hl.exec_cmd("zoom")
    hl.exec_cmd("vivaldi")

    -- Power management - turns off display after 15min, locks screen after 3h (see hypridle.conf)
    hl.exec_cmd("hypridle")

    -- Uncomment if you want network manager applet
    -- hl.exec_cmd("nm-applet")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,   -- Gaps between windows
        gaps_out = 20,  -- Gaps between windows and monitor edges

        border_size = 2, -- Window border thickness

        -- Window border colors - active window has gradient, inactive is gray
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle", -- Default layout algorithm
    },

    decoration = {
        rounding       = 10, -- Rounded corners radius
        rounding_power = 2,  -- Rounding algorithm power

        -- Window transparency settings
        active_opacity   = 1.0, -- Focused window opacity
        inactive_opacity = 1.0, -- Unfocused window opacity

        shadow = {
            enabled      = true,           -- Enable window shadows
            range        = 4,              -- Shadow blur radius
            render_power = 3,              -- Shadow rendering intensity
            color        = 0xee1a1a1a,     -- Shadow color
        },

        blur = {
            enabled  = true, -- Enable background blur
            size     = 3,    -- Blur radius
            passes   = 1,    -- Number of blur passes
            vibrancy = 0.1696, -- Blur vibrancy
        },
    },

    animations = {
        enabled = true, -- Enable animations
    },
})

-- Animation curves - defines easing functions
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Animation definitions - smooth and responsive for productivity
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- Maintains split ratios when adding windows
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master", -- New windows become master in master layout
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background
        key_press_enables_dpms   = true, -- Wake monitor on key press after manual dpms off
        mouse_move_enables_dpms  = true, -- Wake monitor on mouse move after manual dpms off
    },

    debug = {
        disable_logs = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru,il", -- Keyboard layout
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1, -- Focus follows mouse cursor

        sensitivity = 0, -- Mouse sensitivity: -1.0 to 1.0, 0 means no modification

        touchpad = {
            natural_scroll = false, -- Disable natural scrolling for touchpad
        },
    },
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

--------------------
---- CORE BINDS ----
--------------------

-- Essential application launches
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))        -- Open terminal
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd(menu))            -- Open application menu
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))     -- Open file manager (yazi)
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManagerGui)) -- Open file manager (Dolphin)
hl.bind(mainMod .. " + V",      hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

hl.bind(mainMod .. " + Space",       hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { locked = true }) -- Layout switch (works on lock screen too)
hl.bind(mainMod .. " + SHIFT + R",   hl.dsp.exec_cmd("hyprctl reload"))                                      -- Reload Hyprland configuration
hl.bind(mainMod .. " + BackSpace",   hl.dsp.exec_cmd("sleep 0.5 && hyprctl dispatch dpms off"))               -- Super+Backspace to turn off monitor
hl.bind(mainMod .. " + SHIFT + BackSpace", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))                    -- Super+Shift+Backspace to lock

-- Window management
hl.bind(mainMod .. " + Q",       hl.dsp.window.close())                       -- Close active window
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())                             -- Exit Hyprland (safer than Super+Q)
hl.bind(mainMod .. " + F",       hl.dsp.window.float())                       -- Toggle floating mode
hl.bind(mainMod .. " + Escape",  hl.dsp.window.fullscreen({ mode = "fullscreen" })) -- Toggle fullscreen

-- Move windows with vim-style keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Preselect direction for a new window
hl.bind(mainMod .. " + ALT + H", hl.dsp.layout("preselect l")) -- Next window goes left
hl.bind(mainMod .. " + ALT + J", hl.dsp.layout("preselect d")) -- Next window goes down
hl.bind(mainMod .. " + ALT + K", hl.dsp.layout("preselect u")) -- Next window goes up
hl.bind(mainMod .. " + ALT + L", hl.dsp.layout("preselect r")) -- Next window goes right

-- Layout management
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())              -- Dwindle pseudotiling
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))        -- Dwindle toggle split direction
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("hyprctl keyword general:layout dwindle"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("hyprctl keyword general:layout master"))

--------------------
---- NAVIGATION ----
--------------------

-- Move focus with arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Move focus with vim-style keys (great for coding workflow)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" })) -- Focus left
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" })) -- Focus down
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" })) -- Focus up
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" })) -- Focus right

-----------------------
---- WINDOW RESIZE ----
-----------------------

-- Enter resize mode - then use arrow keys to resize, Escape to exit
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right",  hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true }) -- Grow width
    hl.bind("left",   hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true }) -- Shrink width
    hl.bind("up",     hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true }) -- Shrink height
    hl.bind("down",   hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true }) -- Grow height
    hl.bind("escape", hl.dsp.submap("reset"))                                                             -- Exit resize mode
end)

-------------------
---- WORKSPACES ----
-------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad) - great for temporary windows
hl.bind(mainMod .. " + W",         hl.dsp.workspace.toggle_special("magic"))     -- Toggle scratchpad visibility
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:magic" })) -- Move window to scratchpad

-- Minimize window / restore from special workspace
hl.bind("SUPER + Down", hl.dsp.exec_cmd("~/.config/hypr/scripts/minimize.sh"))
hl.bind("SUPER + Up",   hl.dsp.workspace.toggle_special("magic"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" })) -- Next workspace
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" })) -- Previous workspace

--------------------
---- MOUSE BINDS ----
--------------------

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- Super + Left click to move
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Super + Right click to resize

---------------------
---- SCREENSHOTS ----
---------------------

-- Screenshot bindings - requires grim and slurp
hl.bind(mainMod .. " + Print",         hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))                                                   -- Screenshot selection to clipboard
hl.bind("Print",                       hl.dsp.exec_cmd("grim - | wl-copy"))                                                                    -- Screenshot full screen to clipboard
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"))        -- Screenshot selection to file

------------------------
---- MULTIMEDIA KEYS ----
------------------------

-- Volume control (laptop function keys)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Brightness control (laptop function keys)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media player controls - requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

------------------------------
---- WORKSPACE ASSIGNMENTS ----
------------------------------

hl.window_rule({ name = "ws-chrome",   match = { class = "^(google-chrome)$" },       workspace = "1 silent" })
hl.window_rule({ name = "ws-telegram", match = { class = "^(org.telegram.desktop)$" }, workspace = "3 silent" })
hl.window_rule({ name = "ws-zoom",     match = { class = "^(zoom)$" },                workspace = "4 silent" })
hl.window_rule({ name = "ws-vivaldi",  match = { class = "^(vivaldi-stable)$" },       workspace = "5 silent" })

hl.window_rule({
    name  = "float-yazi",
    match = { class = "^(yazi)$" },
    float = true,
    size   = {1000, 700},
    center = true,
})

-- Ignore maximize requests from apps - prevents apps from going fullscreen unexpectedly
hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland applications
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Example window rules for specific applications (uncomment and modify as needed)
-- hl.window_rule({ name = "float-kitty", match = { class = "^(kitty)$", title = "^(kitty)$" }, float = true })
-- hl.window_rule({ name = "ws-obsidian", match = { class = "^(obsidian)$" }, workspace = "2" })
-- hl.window_rule({ name = "size-floating-app", match = { class = "^(floating-app)$" }, size = {800, 600} })

------------------------------------
---- OPTIONAL: SMART GAPS FEATURE ----
------------------------------------

-- "Smart gaps" / "No gaps when only one window" - uncomment to enable
-- This removes gaps when there's only one window on a workspace
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "no-gaps-f1",   match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 0 })
