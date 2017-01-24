local FTC = FTC
FTC.Log = {}

--[[
 * Initialize Combat Log Component
 * --------------------------------
 * Called by FTC:Initialize()
 * --------------------------------
 ]] --
function FTC.Log:Initialize()

	-- Load LibMsgWin Library
	LMW = LibStub("LibMsgWin-1.0")

	-- Maybe create the log
	if (FTC_CombatLog == nil) then FCL = LMW:CreateMsgWindow("FTC_CombatLog", GetString(FTC_CL_Label), nil, nil) end
	FCL:SetDimensions(FTC.Vars.LogWidth, FTC.Vars.LogHeight)
	FCL:SetParent(FTC_UI)
	FCL:ClearAnchors()
	FCL:SetAnchor(unpack(FTC.Vars.FTC_CombatLog))
	FCL:SetClampedToScreen(false)
	FCL:SetHandler("OnMouseUp", function() FTC.Menu:MoveLog() end)

	-- Change the styling
	FCL.buffer = _G["FTC_CombatLogBuffer"]
	FCL.buffer:SetFont(FTC.UI:Font(FTC.Vars.LogFont, FTC.Vars.LogFontSize, true))
	FCL.buffer:SetMaxHistoryLines(1000)
	FTC_CombatLogLabel:SetFont(FTC.UI:Font(FTC.Vars.LogFont, FTC.Vars.LogFontSize + 2, true))
	FTC_CombatLogBg:SetAlpha(FTC.Vars.LogOpacity / 100)

	-- Save initialization status
	FTC.init.Log = true

	-- Hook into chat system
	ZO_PreHook(CHAT_SYSTEM, "Minimize", function() FTC.Log:SetupChat(false) end)
	ZO_PreHook(CHAT_SYSTEM, "Maximize", function() FTC.Log:SetupChat(true) end)

	FTC.Log:RegisterEvents()
end

function FTC.Log:Reinitialize()
	FTC.Log:UnregisterEvents()
	FTC.Log:Initialize()
end