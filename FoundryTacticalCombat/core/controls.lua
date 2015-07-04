
--[[----------------------------------------------------------
    CORE UI CONTROLS
  ]]----------------------------------------------------------

	--[[ 
	 * Create Common Controls
	 * --------------------------------
	 * Called by FTC.UI:Initialize()
	 * --------------------------------
	 ]]--
	function FTC.UI:Controls()

        -- Create a parent FTC window
        FTC.UI:TopLevelWindow( "FTC_UI" , GuiRoot , {GuiRoot:GetWidth(),GuiRoot:GetHeight()} , {CENTER,CENTER,0,0} , false )

		-- Load LibMsgWin Library
		LMW = LibStub("LibMsgWin-1.0")

		-- Create the welcome window
		welcome = LMW:CreateMsgWindow("FTC_Welcome", GetString(FTC_ShortInfo) , nil , nil )
		welcome:SetDimensions(1000,math.min(1000,GuiRoot:GetHeight()*0.8))
		welcome:ClearAnchors()
		welcome:SetAnchor(TOP,GuiRoot,TOP,0,100)
		welcome:SetMouseEnabled(false)
		welcome:SetHidden(false)

		-- Create close button
		welcome.close = FTC.UI:Button( "FTC_WelcomeClose", welcome, {48,48}, {TOPRIGHT,TOPRIGHT,0,6}, BSTATE_NORMAL, nil, nil, nil, nil, nil, false )
		welcome.close:SetNormalTexture('/esoui/art/buttons/closebutton_up.dds')
		welcome.close:SetMouseOverTexture('/esoui/art/buttons/closebutton_mouseover.dds')
		welcome.close:SetHandler("OnClicked", FTC.Welcome )
		
		-- Change the styling
		welcome.buffer = _G["FTC_WelcomeBuffer"]
		welcome.buffer:SetFont(FTC.UI:Font("standard",18,true))
		welcome.buffer:SetMaxHistoryLines(1000)
		FTC_WelcomeLabel:SetFont(FTC.UI:Font("esobold",28,true))
		FTC_WelcomeSlider:SetHidden(false)
	end

	--[[ 
	 * Add Welcome Message
	 * --------------------------------
	 * Called by FTC.UI:Controls()
	 * --------------------------------
	 ]]--
	function FTC.UI:Welcome()

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
				"Unit Frames",
				"Fix bug when reforming groups that prevented FTC group and raid frames from being properly displayed.",
			},

			[2] = {
				"Damage Stats",
				"Require FTC elements to be unlocked to reposition the mini DPS meter.",
			},

			[3] = {
				"Settings Menu",
				"Updated to newest version of LibAddonMenu.",
				"Fix bug with LibAddonMenu that caused certain menu-only elements to continue being displayed outside of the settings menu.",
				"Improve the behavior of the interface for repositioning FTC elements.",
			},
		}

		-- Write to window
		for i = 1 , #Changes do 
			local list = Changes[i]
			welcome:AddText("|c|r")		
			welcome:AddText(list[1])		
			for i = 2 , #list do
				welcome:AddText("+ " .. list[i])	
			end
		end

		-- Add closing messages
		welcome:AddText("|c|r")	
		welcome:AddText("If you have any feedback, bug reports, or other questions about Foundry Tactical Combat please contact |cCC6600@Atropos|r on the North American PC megaserver or send an email to |cCC6600atropos@tamrielfoundry.com|r. Thank you for using the FTC addon and for your support!")
	end