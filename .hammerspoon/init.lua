require('hs.ipc')
hs.loadSpoon('EmmyLua')

-- tap ctrl to send escape

local sendEsc = false
local lastMod = {}

CtrlKeyTimer = hs.timer.delayed.new(0.20, function()
  sendEsc = false
end)

CtrlTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(evt)
  local newMod = evt:getFlags()

  if lastMod["ctrl"] == newMod["ctrl"] then
    return false
  end

  if not lastMod["ctrl"] then
    lastMod = newMod
    sendEsc = true
    CtrlKeyTimer:start()
  else
    if sendEsc then
      if lastMod["cmd"] then
      elseif lastMod["shift"] and lastMod["alt"] then
        hs.eventtap.keyStroke({"shift", "alt"}, "escape", 0)
      elseif lastMod["shift"] then
        hs.eventtap.keyStroke({"shift"}, "escape", 0)
      elseif lastMod["alt"] then
        hs.eventtap.keyStroke({"alt"}, "escape", 0)
      else
        hs.eventtap.keyStroke({}, "escape", 0)
      end
    end
    lastMod = newMod
    CtrlKeyTimer:stop()
  end

  return false
end):start()

OtherTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function()
  sendEsc = false
  return false
end):start()
