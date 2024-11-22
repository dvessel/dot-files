require('hs.ipc')

hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')
hs.loadSpoon("AppWindowSwitcher")
-- hs.loadSpoon('EmmyLua')

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()
spoon.AppWindowSwitcher:bindHotkeys({
   ["com.apple.Safari"]       = {"shift-ctrl", "1"},
   ["com.vscodium"]           = {"shift-ctrl", "2"},
   ["com.googlecode.iterm2"]  = {"shift-ctrl", "3"},
   ["com.apple.finder"]       = {"shift-ctrl", "4"},
})
