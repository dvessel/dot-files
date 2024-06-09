require('hs.ipc')
hs.loadSpoon('EmmyLua')

-- tap ctrl to send escape

local sendEsc = false
local lastMod = {}

CtrlKeyTimer = hs.timer.delayed.new(0.15, function()
  sendEsc = false
end)

CtrlTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  local newMod = event:getFlags()

  if lastMod.ctrl == newMod.ctrl then
    return false
  end

  if not lastMod.ctrl then
    sendEsc = true
    CtrlKeyTimer:start()
  else
    if sendEsc then
      lastMod.ctrl = nil
      local mods={}
      for m in pairs(lastMod) do
        table.insert(mods, m)
      end
      hs.eventtap.keyStroke(mods, 'escape', 0)
    end
    CtrlKeyTimer:stop()
  end
  lastMod = newMod

  return false
end):start()

-- cancel tap escape for other keys
OtherTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function()
  sendEsc = false
  return false
end):start()
