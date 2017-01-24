--[[
     * Register Event Listeners
     * --------------------------------
     * Called by FTC:Initialize()
     * --------------------------------
     ]] --
function FTC.UI:RegisterEvents()
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_SCREEN_RESIZED, FTC.UI.OnScreenResize)
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_SKILL_POINTS_CHANGED, FTC.UI.OnAbilitiesChanged)
end

function FTC.UI:OnScreenResize()
	FTC.UI:TopLevelWindow("FTC_UI", GuiRoot, { GuiRoot:GetWidth(), GuiRoot:GetHeight() },
		{ CENTER, CENTER, 0, 0 }, false)
end

function FTC.UI:OnAbilitiesChanged()
	FTC.UI:GetAbilityIcons()
end