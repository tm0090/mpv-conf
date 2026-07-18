local mp = require 'mp'

-- Create an OSD overlay channel
local overlay = mp.create_osd_overlay("ass-events")

function clear_overlay()
    overlay.data = ""
    overlay:update()
end

function show_end_time()
    local w, h = mp.get_osd_size()
    local mouse = mp.get_property_native("mouse-pos")
    
    -- Make sure we have window dimensions and mouse coordinates
    if w and h and w > 0 and h > 0 and mouse and mouse.y then
        
        -- Check if the mouse is in the bottom 20% of the screen
        if mouse.y > (h * 0.8) then
            local remaining = mp.get_property_number("time-remaining")
            local speed = mp.get_property_number("speed")
            
            if remaining and speed then
                local real_remaining = remaining / speed
                local end_time = os.time() + real_remaining
                local formatted_time = os.date("%I:%M %p", end_time)
                
                local x = w - 450 -- 450 pixels for the gap on the right
                local y = h - 105 -- 105 pixels to keep it from the bottom
                
                -- Added \fnArial to force a consistent font and \fs25 for your font size
                overlay.data = string.format("{\\an3\\fnArial\\fs25\\pos(%d,%d)}Finishes at: %s", x, y, formatted_time)
                overlay:update()
            end
        else
            -- Immediately clear the text if the mouse leaves the bottom area
            clear_overlay()
        end
    end
end

mp.register_event("end-file", clear_overlay)

-- Listen to the mouse movement
mp.observe_property("mouse-pos", "native", show_end_time)

-- Listen to playback speed changes (updates instantly when you speed up/slow down)
mp.observe_property("speed", "number", show_end_time)

-- Listen to the time remaining (updates instantly when you seek/cut to another time)
mp.observe_property("time-remaining", "number", show_end_time)
