function GetControlPanelSettings()

	local ControlPanelSettings = {}
	ControlPanelSettings.pos = {}
	ControlPanelSettings.bg = {}
	ControlPanelSettings.flags = {}
	ControlPanelSettings.text = {}
	ControlPanelSettings.text.fonts = {}
	ControlPanelSettings.text.stroke = {}

	ControlPanelSettings.pos.x = _G[YAG_SETTINGS]["ControlPanelX"]
	ControlPanelSettings.pos.y = _G[YAG_SETTINGS]["ControlPanelY"]

	ControlPanelSettings.bg.alpha   = _G[YAG_SETTINGS]["ControlPanelBackgroundTransparency"]
	ControlPanelSettings.bg.red     = _G[YAG_SETTINGS]["ControlPanelBackgroundRed"]
	ControlPanelSettings.bg.green   = _G[YAG_SETTINGS]["ControlPanelBackgroundGreen"]
	ControlPanelSettings.bg.blue    = _G[YAG_SETTINGS]["ControlPanelBackgroundBlue"]
	ControlPanelSettings.bg.visible = _G[YAG_SETTINGS]["ControlPanelBackgroundVisible"]

	ControlPanelSettings.flags.right     = _G[YAG_SETTINGS]["ControlPanelJustifyRight"]
	ControlPanelSettings.flags.bottom    = _G[YAG_SETTINGS]["ControlPanelJustifyBottom"]
	ControlPanelSettings.flags.bold      = _G[YAG_SETTINGS]["ControlPanelBold"]
	ControlPanelSettings.flags.draggable = _G[YAG_SETTINGS]["ControlPanelDraggable"]
	ControlPanelSettings.flags.italic    = _G[YAG_SETTINGS]["ControlPanelItalic"]

	ControlPanelSettings.padding = _G[YAG_SETTINGS]["ControlPanelPadding"]

	ControlPanelSettings.text.size  = _G[YAG_SETTINGS]["ControlPanelFontSize"]
	ControlPanelSettings.text.font  = _G[YAG_SETTINGS]["ControlPanelFont"]
	ControlPanelSettings.text.alpha = _G[YAG_SETTINGS]["ControlPanelFontTransparency"]
	ControlPanelSettings.text.red   = _G[YAG_SETTINGS]["ControlPanelFontRed"]
	ControlPanelSettings.text.green = _G[YAG_SETTINGS]["ControlPanelFontGreen"]
	ControlPanelSettings.text.blue  = _G[YAG_SETTINGS]["ControlPanelFontBlue"]

	ControlPanelSettings.text.stroke.width = _G[YAG_SETTINGS]["ControlPanelFontOutlineWidth"]
	ControlPanelSettings.text.stroke.alpha = _G[YAG_SETTINGS]["ControlPanelFontOutlineTransparency"]
	ControlPanelSettings.text.stroke.red   = _G[YAG_SETTINGS]["ControlPanelFontOutlineRed"]
	ControlPanelSettings.text.stroke.green = _G[YAG_SETTINGS]["ControlPanelFontOutlineGreen"]
	ControlPanelSettings.text.stroke.blue  = _G[YAG_SETTINGS]["ControlPanelFontOutlineBlue"]

	return ControlPanelSettings
end