--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]

local helpers  = require("lain.helpers")
local wibox    = require("wibox")
local tonumber = tonumber

-- {thermal,core} temperature info
-- lain.widget.temp

local function factory(args)
    local temp     = { widget = wibox.widget.textbox() }
    local args     = args or {}
    local timeout  = args.timeout or 30
    local tempfile = args.tempfile or "/sys/devices/virtual/thermal/thermal_zone0/temp"
    local settings = args.settings or function() end

    function temp.update()
        -- helpers.async({"find", "/sys/devices", "-type", "f", "-name", "*temp*"}, function(f)
        -- helpers.async({ 'sensors | grep -E "\\+[0-9]*.[0-9]°C[ ]"' }, function(f)
        helpers.async({ 'sensors'}, function(f)
            local temp_value
	    for t in f:gmatch("temp1:%s*+[0-9][0-9]") do
		    -- temp_value = t:gsub("\n", "")
		    temp_value = t
	    end
	    for t in f:gmatch("Tctl:%s*+[0-9][0-9]") do
		    temp_value = temp_value .. t
	    end
            -- coretemp_now = temp_now[tempfile] or "N/A"
	    coretemp_now = temp_value:gsub("%s", ""):gsub("+", ""):gsub("Tctl:", "°C "):gsub("temp1:","")
            widget = temp.widget
            settings()
        end)
    end

    helpers.newtimer("thermal", timeout, temp.update)

    return temp
end

return factory
