-- require('hs.ipc')

-- hs.loadSpoon('EmmyLua')
hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')
hs.loadSpoon("AppWindowSwitcher")

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()
spoon.AppWindowSwitcher:bindHotkeys({
  ["Safari"]   = {"shift-ctrl", "1"},
  ["VSCodium"] = {"shift-ctrl", "2"},
  ["Ghostty"]  = {"shift-ctrl", "3"},
  ["Finder"]   = {"shift-ctrl", "4"},
})
