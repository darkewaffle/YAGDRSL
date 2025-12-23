--@@require "YAGDRSL/display/display_modorders.lua"

function SelfCommandOrders()

	STATE_DISPLAY_ORDER_DEBUG = not STATE_DISPLAY_ORDER_DEBUG

	if STATE_DISPLAY_ORDER_DEBUG then
		InitializeDisplayModOrders()
	else
		DestroyDisplayModOrders()
	end
end