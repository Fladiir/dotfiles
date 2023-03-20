
-- Add a titlebar if titlebars_enabled is set to true in the rules.
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")

client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    local titleText = awful.titlebar.widget.titlewidget(c)
    titleText.markup="<b>" .. (c.name or "") .. "</b>"


    awful.titlebar(c, {
	size				= 20,
	bg_normal 	= '#080c10',
	bg_focus 		= '#080c10',
	fg_normal 	= '#ffffff',
	fg_focus 		= '#ffffff',
	font 				= beautiful.titlebar_font,

    }) : setup {
        { -- Left
            awful.titlebar.widget.floatingbutton (c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = titleText
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)
