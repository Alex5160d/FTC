--[[
     * Register Event Listeners
     * --------------------------------
     * Called by FTC:Initialize()
     * --------------------------------
     ]] --
function FTC.UI:RegisterEvents()
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_PLAYER_ACTIVATED, FTC.UI.OnLoad)
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_SCREEN_RESIZED, FTC.UI.OnScreenResize)
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_SKILL_POINTS_CHANGED, FTC.UI.OnAbilitiesChanged)
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_ACTION_LAYER_POPPED, FTC.UI.OnLayerChange)
	EVENT_MANAGER:RegisterForEvent("FTC_UI", EVENT_ACTION_LAYER_PUSHED, FTC.UI.OnLayerChange)
end

-- Show welcome message
function FTC.UI:OnLoad()
	FTC.UI:Welcome()
	EVENT_MANAGER:UnregisterForEvent("FTC_UI", EVENT_PLAYER_ACTIVATED)
end

function FTC.UI:OnScreenResize()
	FTC.UI:TopLevelWindow("FTC_UI", GuiRoot, { GuiRoot:GetWidth(), GuiRoot:GetHeight() },
		{ CENTER, CENTER, 0, 0 }, false)
end

function FTC.UI:OnAbilitiesChanged()
	FTC.UI:GetAbilityIcons()
end

function FTC.UI:OnLayerChange(eventCode, layerIndex, activeLayerIndex)
	FTC.UI:ToggleVisibility(activeLayerIndex)
end