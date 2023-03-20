local wibox = require("wibox")
local helpers = require("../helpers")




local container = class()

function container:init()
	local template = {
		id = "rotate",
		{
			id = "margin",
			{
				id = "background",
				{
				},
				widget = wibox.container.margin
			},
			widget = wibox.container.margin
		},
		widget = wibox.container.rotate
	}

	return template
end
