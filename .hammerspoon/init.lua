hs.ipc.cliInstall()

require('control-escape')

keyUpDown = function(modifiers, key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

