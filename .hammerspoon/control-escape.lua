SEND_ESC = false
LAST_MOD = {}

CTRL_KEY_HANDLER = function()
	SEND_ESC = false
end

CTRL_KEY_TIMER = hs.timer.delayed.new(0.15, CTRL_KEY_HANDLER)

CTRL_HANDLER = function(evt)
	local new_mod = evt:getFlags()

	if LAST_MOD["ctrl"] == new_mod["ctrl"] then
		return false
	end

	if not LAST_MOD["ctrl"] then
		LAST_MOD = new_mod
		SEND_ESC = true
		CTRL_KEY_TIMER:start()
	else
		if SEND_ESC then
			keyUpDown({}, "escape")
		end
		LAST_MOD = new_mod
		CTRL_KEY_TIMER:stop()
	end

	return false
end

CTRL_TAP = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, CTRL_HANDLER)
CTRL_TAP:start()

OTHER_HANDLER = function(evt)
	SEND_ESC = false
	return false
end

OTHER_TAP = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, OTHER_HANDLER)
OTHER_TAP:start()
