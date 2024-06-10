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
hs.loadSpoon("ReloadConfiguration")

-- cancel tap escape for other keys
OtherTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function()
  sendEsc = false
  return false
end):start()
spoon.ReloadConfiguration:start()

-- window switcher
Switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true), {
  fontName = 'SF Compact Display',
  backgroundColor = {0, 0, 0, 0.5},
  highlightColor = {0.2, 0.2, 0.2, 0.5},
  showSelectedThumbnail = false,
  showThumbnails = false,
  textColor = {1, 1, 1},
  textSize = 12,
  titleBackgroundColor = {alpha=0}
})
hs.hotkey.bind('cmd', '`', nil, function() Switcher:next() end)
hs.hotkey.bind('cmd-shift', '`', nil, function() Switcher:previous() end)
