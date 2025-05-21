-- hs.hotkey.bind({ "ctrl" }, "§", function()
-- 	wez = hs.application.find("Wezterm")
-- 	if wez then
-- 		if wez:isFrontmost() then
-- 			wez:hide()
-- 		else
-- 			local nowspace = hs.spaces.focusedSpace()
-- 			local screen = hs.screen.mainScreen()
-- 			wez_window = wez:mainWindow()
-- 			hs.spaces.moveWindowToSpace(wez_window, nowspace)
-- 			local max = screen:fullFrame()
-- 			local f = wez_window:frame()
-- 			f.x = max.x + 60
-- 			f.y = max.y
-- 			f.w = max.w - 120
-- 			f.h = max.h * 0.8
-- 			hs.timer.doAfter(0.2, function()
-- 				wez_window:setFrame(f, 0)
-- 			end)
-- 			wez_window:focus()
-- 		end
-- 	end
-- end)

function topFocus(app)
	-- get screen where you are with your mouse
	local screen = hs.mouse.getCurrentScreen()
	-- get main window
	local app_window = app:mainWindow()
	-- move app to current screen
	app_window:moveToScreen(screen, true, false, 0)
	-- get max coordinates
	local max = screen:fullFrame()
	-- get main window frame
	local f = app_window:frame()
	-- set dimension of frame

	local screenFrame = screen:frame()
    local hasDock = max.w ~= screenFrame.w

	if hasDock then
		f.x = max.x + 60
		f.w = max.w - 60
	else
		f.x = max.x
		f.w = max.w
	end

	f.y = max.y
	f.h = max.h * 0.8

	-- set new frame dimension after a little delay
	--hs.timer.doAfter(0.01, function()
	--end)
	-- focus to app
	app_window:setFrame(f, 0)
	app_window:focus()
end

function bindHotkey(appName, key)
  -- bind to CTRL + key
	hs.hotkey.bind({ "ctrl" }, key, function()
		-- find app
		local app = hs.application.find(appName)
		-- if app is running
		if app then
			-- if app is on front
			if app:isFrontmost() then
				-- hide app
				app:hide()
			else
				-- launch function to resize window and focus
				topFocus(app)
			end
		else
			-- launch app
			app = hs.application.open(appName, 2, true)
			-- launch function to resize window and focus
			topFocus(app)
		end
	end)
end

-- call binder with Full Qualified Name of WezTerm and Escape key
bindHotkey("com.github.wez.wezterm", "§")
