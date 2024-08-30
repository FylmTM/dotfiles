hs.hotkey.bind({ "ctrl" }, "§", function()
	wez = hs.application.find("Wezterm")
	if wez then
		if wez:isFrontmost() then
			wez:hide()
		else
			local nowspace = hs.spaces.focusedSpace()
			local screen = hs.screen.mainScreen()
			wez_window = wez:mainWindow()
			hs.spaces.moveWindowToSpace(wez_window, nowspace)
			local max = screen:fullFrame()
			local f = wez_window:frame()
			f.x = max.x + 70
			f.y = max.y
			f.w = max.w - 140
			f.h = max.h * 0.8
			hs.timer.doAfter(0.2, function()
				wez_window:setFrame(f)
			end)
			wez_window:focus()
		end
	end
end)
