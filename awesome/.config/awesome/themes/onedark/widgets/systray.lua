local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

awful.screen.connect_for_each_screen(function(s)
   local bar = awful.wibar({ position = "bottom", screen = s })
   local tray = wibox.widget.systray()
   tray.visible = true
   local tasklist = awful.widget.tasklist {
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      style = {
         shape = helpers.rrect(dpi(2)),
      },
      layout = {
         spacing = dpi(2),
         layout = wibox.layout.flex.horizontal
      },
      widget_template = {
         {
            {
               {
                  {
                     {
                        id = "icon_role",
                        widget = wibox.widget.imagebox
                     },
                     margins = 2,
                     widget = wibox.container.margin
                  },
                  {
                     id = "text_role",
                     widget = wibox.widget.textbox
                  },
                  layout = wibox.layout.fixed.horizontal
               },
               left = 10,
               right = 10,
               widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
         },
         widget = wibox.container.margin,
         forced_width = dpi(200),
         margins = dpi(2)
      }
   }

   bar:setup {
      tasklist,
      nil,
      wibox.widget.systray(),
      layout = wibox.layout.align.horizontal,
   }
end)
