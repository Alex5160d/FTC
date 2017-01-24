--[[
 * Initialize FTC UI Layer
 * --------------------------------
 * Called by FTC:Initialize()
 * --------------------------------
 ]] --
function FTC.UI:Initialize()

	-- Create core controls
	FTC.UI:Controls()

	-- Reference the FTC_UI layer as a scene fragment
	FTC.UI.fragment = ZO_HUDFadeSceneFragment:New(FTC_UI)

	-- Add the fragment to select scenes
	SCENE_MANAGER:GetScene("hud"):AddFragment(FTC.UI.fragment)
	SCENE_MANAGER:GetScene("hudui"):AddFragment(FTC.UI.fragment)
	SCENE_MANAGER:GetScene("siegeBar"):AddFragment(FTC.UI.fragment)

	-- Preload ability icons
	FTC.UI:GetAbilityIcons()

	FTC.UI:RegisterEvents()
end