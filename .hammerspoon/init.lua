require('hs.ipc')

hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()

-- window switcher
local uiPrefs = {
  fontName = 'SF Compact Display',
  backgroundColor = {0, 0, 0, 0.7},
  highlightColor = {0.5, 0.5, 0.5, 0.5},
  showSelectedThumbnail = false,
  textColor = {1, 1, 1},
  textSize = 14,
  thumbnailSize = 128,
  titleBackgroundColor = {alpha=0},
}

SwitcherSpaceAll = hs.window.switcher.new(hs.window.filter.new(), uiPrefs)
hs.hotkey.bind('cmd', '`', nil, function() SwitcherSpaceAll:next() end)
hs.hotkey.bind('cmd-shift', '`', nil, function() SwitcherSpaceAll:previous() end)

SwitcherSpace = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true), uiPrefs)
hs.hotkey.bind('alt', '`', nil, function() SwitcherSpace:next() end)
hs.hotkey.bind('alt-shift', '`', nil, function() SwitcherSpace:previous() end)
