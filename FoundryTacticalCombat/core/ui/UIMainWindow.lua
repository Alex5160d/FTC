--[[
 * Create Common Controls
 * --------------------------------
 * Called by FTC.UI:Initialize()
 * --------------------------------
 ]] --
function FTC.UI:Controls()

	-- Create a parent FTC window
	FTC.UI:TopLevelWindow("FTC_UI", GuiRoot, { GuiRoot:GetWidth(), GuiRoot:GetHeight() }, { CENTER, CENTER, 0, 0 }, false)

	-- Load LibMsgWin Library
	LMW = LibStub("LibMsgWin-1.0")

	-- Create the welcome window
	welcome = LMW:CreateMsgWindow("FTC_Welcome", GetString(FTC_ShortInfo), nil, nil)
	welcome:SetDimensions(1000, math.min(1000, GuiRoot:GetHeight() * 0.8))
	welcome:ClearAnchors()
	welcome:SetAnchor(TOP, GuiRoot, TOP, 0, 100)
	welcome:SetMouseEnabled(false)
	welcome:SetHidden(false)

	-- Create close button
	welcome.close = FTC.UI:Button("FTC_WelcomeClose", welcome, { 48, 48 }, { TOPRIGHT, TOPRIGHT, 0, 6 },
		BSTATE_NORMAL, nil, nil, nil, nil, nil, false)
	welcome.close:SetNormalTexture('/esoui/art/buttons/closebutton_up.dds')
	welcome.close:SetMouseOverTexture('/esoui/art/buttons/closebutton_mouseover.dds')
	welcome.close:SetHandler("OnClicked", FTC.UI.Welcome)

	-- Change the styling
	welcome.buffer = _G["FTC_WelcomeBuffer"]
	welcome.buffer:SetFont(FTC.UI:Font("standard", 18, true))
	welcome.buffer:SetMaxHistoryLines(1000)
	FTC_WelcomeLabel:SetFont(FTC.UI:Font("esobold", 28, true))
	FTC_WelcomeSlider:SetHidden(false)
end

function FTC.UI:TopLevelWindow(name, parent, dims, anchor, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (#dims ~= 2) then return end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	hidden = (hidden == nil) and false or hidden

	-- Create the window
	local window = _G[name]
	if (window == nil) then window = WINDOW_MANAGER:CreateTopLevelWindow(name) end

	-- Apply properties
	window = FTC.Chain(window):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1], #anchor == 5 and
			anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetHidden(hidden).__END
	return window
end

--[[
 * Display Addon Welcome Message / Notes
 * --------------------------------
 * Called by FTC:OnLoad()
 * --------------------------------
 ]] --
function FTC.UI:Welcome()

	-- Show welcome message
	if (FTC.Vars.welcomed ~= FTC.version) then

		-- Only show welcome message for English clients
		if (FTC.language == "en") then

			-- Add welcome message content
			FTC.inWelcome = true
			FTC.UI:WelcomeMessage()

			local buffer = FTC_Welcome:GetNamedChild("Buffer")
			local slider = FTC_Welcome:GetNamedChild("Slider")

			-- Set the welcome position
			buffer:SetScrollPosition(2)
			slider:SetValue(buffer:GetNumHistoryLines() - 2)
			slider:SetHidden(false)
			welcome:SetHidden(false)
			FTC_UI:SetAlpha(0)
		end

		-- Register that the user has been welcomed
		FTC.Vars.welcomed = FTC.version

		-- Do not show
	else
		welcome:SetHidden(true)
		FTC_UI:SetAlpha(100)
	end
end

--[[
 * Add Welcome Message
 * --------------------------------
 * Called by FTC.UI:Controls()
 * --------------------------------
 ]] --
function FTC.UI:WelcomeMessage()

	-- Add welcome messages
	local welcome = _G["FTC_Welcome"]
	welcome:AddText("Hello ESO friends, thank you for downloading the newest version of Foundry Tactical Combat, a combat enhancement addon designed to give players access to relevant combat data in an easy to process framework which allows them to respond quickly and effectively to evolving combat situations.")
	welcome:AddText("|c|r")
	welcome:AddText("You have just installed |cCC6600version " .. FTC.version .. "|r. Please take a few minutes to read over the list of addon changes. This message will not be displayed again once you close it unless you completely reset FTC settings in the options menu.")
	welcome:AddText("|c|r")
	welcome:AddText("To get straight into the action you can access the addon's configuration options by navigating to |cCC6600Settings -> Addon Settings -> FTC|r or by typing |cCC6600/ftc|r in chat. From this menu you can enable or disable FTC components, customize appearance and other component settings, and reposition UI elements added by the FTC addon.")
	welcome:AddText("|c|r")
	welcome:AddText("Additionaly, FTC adds several optional hotkeys which you may bind to make using certain addon features more convenient. These hotkeys can be mapped by navigating to |cCC6600Controls -> Foundry Tactical Combat|r. The next section briefly details the changes included in this version of the addon.")
	welcome:AddText("|c|r")

	-- Add changelog
	welcome:AddText("|cCC6600Version " .. FTC.version .. " Updates|r")

	-- Register changes
	local Changes = {
		[1] = {
			"General Changes",
			"Update addon for ESO v2.3 API compatibility.",
		},
		[2] = {
			"Buff Tracking",
			"Adjusted target buff tracking to avoid showing buff(s) from a previous target.",
		},
		[3] = {
			"Going Forward",
			"We are currently evaluating the Combat Text system added by ZOS, and will be adjusting and enhancing FTC to meld well.  FTC and the standard Combat Text system are a bit redundant, but work together without any problems.  The standard Combat Text system can be managed in Settings/Interface/Combat Text.",
			"Philgo (of Master Merchant fame) will be joining the FTC development efforts going forward.",
		},
		[4] = {
			"Known Issues",
			"The new version of FTC buff tracking doesn't currently work well with ground target AoEs. It does not report a duration for these effects because they are not reported by the API. I will need to develop a separate system for tracking GTAOE timers in a future version.",
		},
	}

	-- Write to window
	for i = 1, #Changes do
		local list = Changes[i]
		welcome:AddText("|c|r")
		welcome:AddText(list[1])
		for i = 2, #list do
			welcome:AddText("+ " .. list[i])
		end
	end

	-- Add closing messages
	welcome:AddText("|c|r")
	welcome:AddText("If you have any feedback, bug reports, or other questions about Foundry Tactical Combat please contact |cCC6600@Atropos|r or |cCC6600@Philgo68|r on the North American PC megaserver or send an email to |cCC6600atropos@tamrielfoundry.com|r or |cCC6600philgo68@gmail.com|r. Thank you for using the FTC addon and for your support!")
end
