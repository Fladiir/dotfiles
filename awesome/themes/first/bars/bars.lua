local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")


local bar_w = class()

function bar_w:init(s)
   
    -- Create a textclock widget
    mytextclock = require("widgets.textclock")({font = beautiful.textclock_font})
    
    -- Create a taglist widget
    s.mytaglist = require("widgets.taglist")(s, {layout = "horizontal"})

    s.bar = awful.wibar({ position = "top", height = beautiful.wibar_size, screen = s})
    s.bar.bg = beautiful.bar_bg
    s.bar.fg = beautiful.bar_fg
    mysystray = require("widgets.systray")({
        layout = "horizontal", 
        hide_icon = beautiful.systray_hide_icon,
        visible = true})


    s.bar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            s.mytaglist,
            expand = "none",
            layout = wibox.layout.fixed.horizontal,
        },
        {-- Middle widget
            mytextclock,
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            expand = "none",
            mysystray,
        },
    }
end

return bar_w
