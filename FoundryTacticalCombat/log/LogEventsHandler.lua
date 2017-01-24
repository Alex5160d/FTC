--[[
     * Register Event Listeners
     * --------------------------------
     * Called by FTC:Initialize()
     * --------------------------------
     ]] --
function FTC.Log:RegisterEvents()
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_PLAYER_ACTIVATED, FTC.Log.OnLoad)
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_ALLIANCE_POINT_UPDATE, FTC.Log.OnAlliancePointsUpdate)
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_EXPERIENCE_UPDATE, FTC.Log.OnXPUpdate)
	EVENT_MANAGER:AddFilterForEvent("FTC_LOG", EVENT_COMBAT_EVENT, REGISTER_FILTER_UNIT_TAG, "player")
end

function FTC.Log:UnregisterEvents()
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_PLAYER_ACTIVATED)
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_ALLIANCE_POINT_UPDATE)
	EVENT_MANAGER:RegisterForEvent("FTC_LOG", EVENT_EXPERIENCE_UPDATE)
end

-- Handles Interface Startup
function FTC.Log:OnLoad()
	-- Setup Combat Log
	if (FTC.Vars.AlternateChat) then CHAT_SYSTEM:Minimize() end
	FTC.Log:Print(GetString(FTC_LongInfo), { 1, 0.8, 0 })

	EVENT_MANAGER:UnregisterForEvent("FTC_LOG", EVENT_PLAYER_ACTIVATED)
end

function FTC.Log:OnAlliancePointsUpdate(eventCode, alliancePoints, playSound, difference)
	if (difference < 0) then return end

	FTC.Log:Print("You earned " .. FTC.DisplayNumber(difference) .. " alliance points.", { 0, 0.6, 0.6 })
end

function FTC.Log:OnXPUpdate(eventCode, unitTag, currentExp, maxExp, reason)
	-- Get the new experience amount
	local diff = math.max(currentExp - FTC.Player.exp, 0)
	if (diff <= 0) then return end

	-- Determine label
	local label = ""
	if (reason == PROGRESS_REASON_KILL) then label = " kill "
	elseif (reason == PROGRESS_REASON_QUEST) then label = " quest "
	else label = " bonus "
	end

	-- Print to log
	FTC.Log:Print("You earned " .. FTC.DisplayNumber(diff) .. label .. "experience.", { 0, 0.6, 0.6 })
end