require('hs.ipc')

local keyUpDown = function(modifiers, key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end
hs.loadSpoon('EmmyLua')

-- tap ctrl to send escape

local send_esc = false
local last_mod = {}
local ctrl_key_timer = hs.timer.delayed.new(0.20, function()
  send_esc = false
end)

hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(evt)
  local new_mod = evt:getFlags()

  if last_mod["ctrl"] == new_mod["ctrl"] then
    return false
  end

  if not last_mod["ctrl"] then
    last_mod = new_mod
    send_esc = true
    ctrl_key_timer:start()
  else
    if send_esc then
      keyUpDown({}, "escape")
    end
    last_mod = new_mod
    ctrl_key_timer:stop()
  end

  return false
end):start()

hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function()
  send_esc = false
  return false
end):start()
