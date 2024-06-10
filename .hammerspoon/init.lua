require('hs.ipc')

hs.loadSpoon('EmmyLua')
hs.loadSpoon('ControlEscape')
hs.loadSpoon("ReloadConfiguration")

spoon.ControlEscape:start()
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
