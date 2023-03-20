local wibox = require("wibox")


textclock_w = class()

function textclock_w:init(args)

    self.font = args.font
    local w = {
        {
            font    = self.font,
            widget  = wibox.widget.textclock
        },
        widget = wibox.container.background
    }

    return w
end

return textclock_w
