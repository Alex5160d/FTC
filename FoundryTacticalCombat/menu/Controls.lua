 
 --[[----------------------------------------------------------
	MENU CONTROLS
	-----------------------------------------------------------
	* Set up controls for the menu component of FTC
	* Uses ZeniMax own virtual controls to create elements
	* Modifies addon saved variables
  ]]--
local LAM = LibStub("LibAddonMenu-1.0")		
function FTC.Menu:Controls()
	
	-- Addon heading
	LAM:AddHeader( FTC.Menu.id , "FTC_Settings_Subtitle", "Foundry Tactical Combat - Version "  .. FTC.version )
	FTC_Settings_SubtitleLabel:SetHeight( 32 )
	FTC_Settings_SubtitleLabel:SetVerticalAlignment(1)
	FTC_Settings_SubtitleLabel:SetHorizontalAlignment(1)
	
	local desc = "Please use this menu to configure addon options."
	local label	= FTC.UI.Label( "FTC_Settings_SubtitleDescription" , FTC_Settings_Subtitle , { FTC_Settings_Subtitle:GetWidth() , 24} , {TOP,BOTTOM,0,0,FTC_Settings_SubtitleLabel} , "ZoFontGame" , nil , {1,1} , desc , false )	
	
	-- Toggle components
	LAM:AddHeader( FTC.Menu.id , "FTC_Settings_ComponentsHeader", "Configure Components")
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_ComponentsFrames", "Enable Frames", "Enable custom unit frames component?", function() return FTC.vars.EnableFrames end , function() FTC.Menu:Toggle( 'EnableFrames' , true ) end , true , "Reloads UI" )
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_ComponentsBuffs", "Enable Buffs", "Enable active buff tracking component?", function() return FTC.vars.EnableBuffs end , function() FTC.Menu:Toggle( 'EnableBuffs' , true ) end , true , "Reloads UI" )	
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_ComponentsDamage", "Enable Damage Statistics", "Enable damage statistics?", function() return FTC.vars.EnableDamage end , function() FTC.Menu:Toggle( 'EnableDamage' , true ) end , true , "Reloads UI" )
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_ComponentsSCT", "Enable Combat Text", "Enable scrolling combat text component?", function() return FTC.vars.EnableSCT end , function() FTC.Menu:Toggle( 'EnableSCT' , true ) end , true , "Reloads UI" )

	-- Unit frames settings
	LAM:AddHeader( FTC.Menu.id , "FTC_Settings_FramesHeader", "Unit Frames Settings")	
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_DisableTarget", "Disable Default Target Frame", "Remove the default ESO target unit frame?", function() return FTC.vars.DisableTargetFrame end , function() FTC.Menu:Toggle( 'DisableTargetFrame' ) end )	
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_FrameText", "Default Unit Frames Text", "Display text attribute values on default unit frames?", function() return FTC.vars.FrameText end , function() FTC.Menu:Toggle( 'FrameText' ) end )	
	if ( FTC.vars.EnableFrames ) then
		LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_EnableNameplate", "Show Player Nameplate", "Show your own character's nameplate?", function() return FTC.vars.EnableNameplate end , function() FTC.Menu:Toggle( 'EnableNameplate' ) end )	
		LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_EnableXPBar", "Enable Mini Experience Bar", "Show a small experience bar on the player frame?", function() return FTC.vars.EnableXPBar end , function() FTC.Menu:Toggle( 'EnableXPBar' ) end )	
	end

	-- Buffs settings
	if ( FTC.vars.EnableBuffs ) then 
		LAM:AddHeader( FTC.Menu.id , "FTC_Settings_BuffsHeader", "Buff Tracker Settings")		
		LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_AnchorBuffs", "Anchor Buffs", "Anchor buffs to unit frames?", function() return FTC.vars.AnchorBuffs end , function() FTC.Menu:Toggle( 'AnchorBuffs' , true ) end  )
		LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_EnableLongBuffs", "Display Long Buffs", "Track long duration player buffs?", function() return FTC.vars.EnableLongBuffs end , function() FTC.Menu:Toggle( 'EnableLongBuffs' ) end )
	end
	
	-- Scrolling combat text settings
	if ( FTC.vars.EnableSCT ) then 
		LAM:AddHeader( FTC.Menu.id , "FTC_Settings_SCTHeader", "Scrolling Combat Text Settings")		
		LAM:AddSlider( FTC.Menu.id , "FTC_Settings_SCTSpeed", "Combat Text Scroll Speed", "Adjust combat text scroll speed.", 1, 5, 1, function() return FTC.vars.SCTSpeed end, function( value ) FTC.Menu:Update( "SCTSpeed" , value ) end )		
		LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_SCTNames", "Display Ability Names", "Display ability names in combat text?", function() return FTC.vars.SCTNames end , function() FTC.Menu:Toggle( 'SCTNames' ) end , true , "Reloads UI" )		
		LAM:AddDropdown( FTC.Menu.id , "FTC_Settings_SCTPath", "Scroll Path Animation", "Choose scroll animation.", { "Arc", "Line" }, function() return FTC.vars.SCTPath end, function( value )  FTC.Menu:Update( "SCTPath" , value ) end )
	end
	
	-- Damage meter settings
	if ( FTC.vars.EnableDamage ) then 
		LAM:AddHeader( FTC.Menu.id , "FTC_Settings_DamageHeader", "Damage Tracker Settings")		
		LAM:AddSlider( FTC.Menu.id , "FTC_Settings_DamageTimeout", "Timeout Threshold", "Number of seconds without damage to signal encounter termination", 5, 60, 5, function() return FTC.vars.DamageTimeout end, function( value ) FTC.Menu:Update( "DamageTimeout" , value ) end )		
	end
	
	-- Reposition elements
	LAM:AddHeader( FTC.Menu.id , "FTC_Settings_PositionHeader", "Reposition FTC Elements")
	LAM:AddCheckbox( FTC.Menu.id , "FTC_Settings_FramesUnlock", "Lock Positions", "Modify FTC frame positions?" , function() return not FTC.move end , function() FTC.Menu:MoveFrames() end )
	
	-- Restore defaults
	LAM:AddHeader( FTC.Menu.id , "FTC_Settings_ResetHeader", "Reset Settings")
	LAM:AddButton( FTC.Menu.id , "FTC_Settings_ResetButton", "Restore Defaults", "Restore FTC to default settings.", function() FTC.Menu:Reset() end , true , "Reloads UI" )

end