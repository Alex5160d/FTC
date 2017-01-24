function FTC.UI:Control(name, parent, dims, anchor, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	hidden = (hidden == nil) and false or hidden

	-- Create the control
	local control = _G[name]
	if (control == nil) then control = WINDOW_MANAGER:CreateControl(name, parent, CT_CONTROL) end

	-- Apply properties
	local control = FTC.Chain(control):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetHidden(hidden).__END
	return control
end

function FTC.UI:Backdrop(name, parent, dims, anchor, center, edge, tex, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	center = (center ~= nil and #center == 4) and center or { 0, 0, 0, 0.4 }
	edge = (edge ~= nil and #edge == 4) and edge or { 0, 0, 0, 1 }
	hidden = (hidden == nil) and false or hidden

	-- Create the backdrop
	local backdrop = _G[name]
	if (backdrop == nil) then backdrop = WINDOW_MANAGER:CreateControl(name, parent, CT_BACKDROP) end

	-- Apply properties
	local backdrop = FTC.Chain(backdrop):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetCenterColor(center[1], center[2],
		center[3], center[4]):SetEdgeColor(edge[1], edge[2], edge[3],
		edge[4]):SetEdgeTexture("", 8, 2, 2):SetHidden(hidden):SetCenterTexture(tex).__END
	return backdrop
end

function FTC.UI:Label(name, parent, dims, anchor, font, color, align, text, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	font = (font == nil) and "ZoFontGame" or font
	color = (color ~= nil and #color == 4) and color or { 1, 1, 1, 1 }
	align = (align ~= nil and #align == 2) and align or { 1, 1 }
	hidden = (hidden == nil) and false or hidden

	-- Create the label
	local label = _G[name]
	if (label == nil) then label = WINDOW_MANAGER:CreateControl(name, parent, CT_LABEL) end

	-- Apply properties
	local label = FTC.Chain(label):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetFont(font):SetColor(color[1],
		color[2], color[3],
		color[4]):SetHorizontalAlignment(align[1]):SetVerticalAlignment(align[2]):SetText(text):SetHidden(hidden).__END
	return label
end

function FTC.UI:Statusbar(name, parent, dims, anchor, color, tex, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	color = (color ~= nil and #color == 4) and color or { 1, 1, 1, 1 }
	hidden = (hidden == nil) and false or hidden

	-- Create the status bar
	local bar = _G[name]
	if (bar == nil) then bar = WINDOW_MANAGER:CreateControl(name, parent, CT_STATUSBAR) end

	-- Apply properties
	local bar = FTC.Chain(bar):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetColor(color[1], color[2], color[3],
		color[4]):SetHidden(hidden):SetTexture(tex).__END
	return bar
end

function FTC.UI:Texture(name, parent, dims, anchor, tex, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	if (tex == nil) then tex = '/esoui/art/icons/icon_missing.dds' end
	hidden = (hidden == nil) and false or hidden

	-- Create the texture
	local texture = _G[name]
	if (texture == nil) then texture = WINDOW_MANAGER:CreateControl(name, parent, CT_TEXTURE) end

	-- Apply properties
	local texture = FTC.Chain(texture):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetTexture(tex):SetHidden(hidden).__END
	return texture
end

function FTC.UI:Cooldown(name, parent, dims, anchor, color, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	color = (color ~= nil and #color == 4) and color or { 1, 1, 1, 1 }
	hidden = (hidden == nil) and false or hidden

	-- Create the texture
	local cooldown = _G[name]
	if (cooldown == nil) then cooldown = WINDOW_MANAGER:CreateControl(name, parent, CT_COOLDOWN) end

	-- Apply properties
	local cooldown = FTC.Chain(cooldown):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3], anchor[4]):SetFillColor(color[1], color[2],
		color[3], color[4]).__END
	return cooldown
end

function FTC.UI:Button(name, parent, dims, anchor, state, font, align, normal, pressed, mouseover, hidden)

	-- Validate arguments
	if (name == nil or name == "") then return end
	parent = (parent == nil) and GuiRoot or parent
	if (dims == "inherit" or #dims ~= 2) then dims = { parent:GetWidth(), parent:GetHeight() } end
	if (#anchor ~= 4 and #anchor ~= 5) then return end
	state = (state ~= nil) and state or BSTATE_NORMAL
	font = (font == nil) and "ZoFontGame" or font
	align = (align ~= nil and #align == 2) and align or { 1, 1 }
	normal = (normal ~= nil and #normal == 4) and normal or { 1, 1, 1, 1 }
	pressed = (pressed ~= nil and #pressed == 4) and pressed or { 1, 1, 1, 1 }
	mouseover = (mouseover ~= nil and #mouseover == 4) and mouseover or { 1, 1, 1, 1 }
	hidden = (hidden == nil) and false or hidden

	-- Create the button
	local button = _G[name]
	if (button == nil) then button = WINDOW_MANAGER:CreateControl(name, parent, CT_BUTTON) end

	-- Apply properties
	local button = FTC.Chain(button):SetDimensions(dims[1], dims[2]):ClearAnchors():SetAnchor(anchor[1],
		#anchor == 5 and anchor[5] or parent, anchor[2], anchor[3],
		anchor[4]):SetState(state):SetFont(font):SetNormalFontColor(normal[1], normal[2], normal[3],
		normal[4]):SetPressedFontColor(pressed[1], pressed[2],
		pressed[3], pressed[4]):SetMouseOverFontColor(mouseover[1], mouseover[2], mouseover[3],
		mouseover[4]):SetHorizontalAlignment(align[1]):SetVerticalAlignment(align[2]):SetHidden(hidden).__END
	return button
end

--[[
* Handle Special Visibility Needs
* --------------------------------
* Called by FTC.OnLayerChange()
* --------------------------------
]] --
function FTC.UI:ToggleVisibility(activeLayerIndex)

	-- We only need to act if it's in move, or welcome mode
	if not (FTC.move or FTC.inWelcome) then return end

	-- Maybe get action layer
	activeLayerIndex = activeLayerIndex or GetNumActiveActionLayers()

	-- Maybe disable move mode
	if (FTC.move and activeLayerIndex > 3) then FTC.Menu:MoveFrames(false) end

	-- Maybe disable welcome message
	if (FTC.inWelcome and activeLayerIndex > 2) then FTC.UI:Welcome() end
end