require('hs.ipc')

hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon('ControlEscape')
-- hs.loadSpoon('EmmyLua')

spoon.ReloadConfiguration:start()
spoon.ControlEscape:start()
