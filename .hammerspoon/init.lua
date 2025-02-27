require('hs.ipc')

-- hs.loadSpoon('EmmyLua')
hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')
hs.loadSpoon("AppWindowSwitcher")

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()
spoon.AppWindowSwitcher:bindHotkeys({
   [""]                       = {"shift-ctrl", "`"},
   ["com.apple.Safari"]       = {"shift-ctrl", "1"},
   ["com.vscodium"]           = {"shift-ctrl", "2"},
   ["com.apple.finder"]       = {"shift-ctrl", "3"},
   ["com.googlecode.iterm2"]  = {"shift-ctrl", "4"},
})
