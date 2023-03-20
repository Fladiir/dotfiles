local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

local beautiful = require("beautiful")
local helpers = require("../helpers")
local keybinds = require("../themes/" .. currtheme .. "/keys")

local taglist_widget = class()

function taglist_widget:text_update(item, tag, index)
    
		if tag.selected then
			if #tag:clients() > 0 then
        item.markup = helpers.colorize_text(beautiful.taglist_text_focused[index], beautiful.taglist_focused_color)
			else
        item.markup = helpers.colorize_text(beautiful.taglist_text_empty[index], beautiful.taglist_focused_color)
			end
    elseif tag.urgent then
        item.markup = helpers.colorize_text(beautiful.taglist_text_urgent[index], beautiful.taglist_urgent_color)
    elseif #tag:clients() > 0 then
        item.markup = helpers.colorize_text(beautiful.taglist_text_occupied[index], beautiful.taglist_occupied_color)
    else
        item.markup = helpers.colorize_text(beautiful.taglist_text_empty[index], beautiful.taglist_empty_color)
    end
end

local function get_size(tag)
	if #tag:clients() > 0 then
  	return beautiful.taglist_buttons_font .. " " .. tostring(beautiful.taglist_occupied_fontsize)
	else
  	return beautiful.taglist_buttons_font .. " " .. tostring(beautiful.taglist_empty_fontsize)
	end
end


function taglist_widget:text_template()
    local t = {
        {
            widget  = wibox.widget.textbox
        },
        margins = 5,
        widget  = wibox.container.margin,
        create_callback = function(item, tag, index, _)
            local w = item:get_children()[1]
            w.align     = "center"
            w.valign    = "center"
						w.font			= get_size(tag)
            self:text_update(w, tag, index)
        end,
        update_callback = function(item, tag, index, _)
            local w = item:get_children()[1]
    				w.font = get_size(tag)
            self:text_update(w, tag, index)
        end
    }

    return t
end

function taglist_widget:select_template() 
    return taglist_widget:text_template()
end

function taglist_widget:select_layout()
    return wibox.layout.fixed.horizontal
end

function taglist_widget:init(s, args)

    --self.layout = args.layout
    self.layout = self:select_layout()
    self.buttons = keybinds.taglist_buttons
    self.template = self:select_template()
    
	local widgets = awful.widget.taglist {
        screen          = s,
        filter          = awful.widget.taglist.filter.all,
        buttons         = self.buttons,
        layout          = self.layout,
        widget_template = self.template
	}

    return widgets
end

return taglist_widget
