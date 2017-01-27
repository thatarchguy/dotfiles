local wibox = require("wibox")

--- User Widgets
batterywidget = wibox.widget.textbox()
batterywidget:set_text("|")
batterywidgettimer = timer({ timeout = 5 })
batterywidgettimer:connect_signal("timeout",
  function()
    fh = assert(io.popen("acpi | cut -d, -f 2,3 -", "r"))
    batterywidget:set_text(" |" .. fh:read("*l") .. " | ")
    fh:close()
  end
)
batterywidgettimer:start()

spotify_widget = wibox.widget.textbox()
spotify_timer = timer ({timeout = 5})
spotify_timer:connect_signal("timeout",
  function()
    current = io.popen("sp current-oneline", "r")
    spotify_widget:set_text(" | " .. current:read())
    current:close()
  end
)
spotify_timer:start()


vpnwidget = wibox.widget.textbox()
vpnwidget:set_text(" | VPN: N/A ")
vpnwidgettimer = timer({ timeout = 5 })
vpnwidgettimer:connect_signal("timeout",
  function()
    status = io.popen("pidof openvpn", "r")
    if status:read() == nil then
        vpnwidget:set_markup(" | <span color='#FF0000'>VPN: OFF</span> ")
    else
        vpnwidget:set_markup(" | <span color='#00FF00'>VPN: ON</span> ")
    end
    status:close()
  end
)
vpnwidgettimer:start()


