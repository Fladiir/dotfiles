local wibox = require("wibox")
local gears = require("gears")
local helpers = require("helpers")
local beautiful = require("beautiful")
local naughty = require("naughty")

local systray_w = class()

function systray_w:select_layout() -- TODO: add grid mode
    if self.layout == "vertical" then
        return wibox.layout.fixed.vertical
    else
        return wibox.layout.fixed.horizontal
    end
end

function systray_w:select_separator_layout() -- TODO: add grid mode
    if self.layout == "horizontal" then
        return wibox.layout.fixed.vertical
    else
        return wibox.layout.fixed.horizontal
    end
end
        
function systray_w:init(args)
    self.layout = args.layout
    self.visible = args.visible
    self.hide_icon = args.hide_icon
    
    local w = wibox.widget({
        {
            {
                {   
                    id = "hide_icon",
                    markup = helpers.colorize_text(self.hide_icon, beautiful.systray_hide_icon_fg),
                    align  = 'center',
                    valign = 'center',
                    font   = beautiful.systray_font,
                    widget = wibox.widget.textbox
                },
                right = 4,
                left = 4,
                widget = wibox.container.margin
            },
            spacing = 5,
            spacing_widget = {
                thickness = 5,
                color = beautiful.systray_hide_sep_color .. "00",
                span_ratio = 1,
                orientation = self:select_separator_layout(),
                widget = wibox.widget.separator
            },
            {
                id = "systray",
                visible = self.visible,
                widget = wibox.widget.systray()
            },
            expand = "none",
            layout = self:select_layout()
        },
        widget = wibox.container.background,
    })
    --[[
    w:connect_signal("mouse::enter", function(item)
        item.bg = "#dddddd44" 
        local icon = w:get_children_by_id('hide_icon')

        local animW = animation.Animation {
            subject = icon,
            duration = 0.7,
            target = { markup = helpers.colorize_text(self.hide_icon, "#ff0000") },
            easing = 'inOutCubic'
        }

        animW:startAnimation()

    end)

    w:connect_signal("mouse::leave", function(item)
        item.bg = "#dddddd00" 
    end)
    ]]--
    w:connect_signal("button::press", function(item, lx, ly, button, _)
        if button == 1 then
            local hide_btn = item:get_children_by_id('hide_icon')[1]
            local systray = item:get_children_by_id('systray')[1]
            
            if self.visible then
                self.visible = false
                hide_btn.markup = helpers.colorize_text(beautiful.systray_hide_icon_hidden, beautiful.systray_hide_icon_fg)
                systray.visible = false
            else
                self.visible = true
                hide_btn.markup = helpers.colorize_text(beautiful.systray_hide_icon, beautiful.systray_hide_icon_fg)
                systray.visible = true 
            end


        end
    end)

    return w
end

return systray_w
