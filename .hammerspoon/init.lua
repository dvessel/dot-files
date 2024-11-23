require('hs.ipc')

hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')
hs.loadSpoon("HoldToQuit")
hs.loadSpoon("AppWindowSwitcher")
-- hs.loadSpoon('EmmyLua')

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()
spoon.HoldToQuit:start()
spoon.AppWindowSwitcher:bindHotkeys({
   [""]                       = {"shift-ctrl", "1"},
   ["com.apple.Safari"]       = {"shift-ctrl", "2"},
   ["com.vscodium"]           = {"shift-ctrl", "3"},
   ["com.googlecode.iterm2"]  = {"shift-ctrl", "4"},
   ["com.apple.finder"]       = {"shift-ctrl", "5"},
})
