function SelfCommandDevLog()

	STATE_DISPLAY_DEV_LOG = not STATE_DISPLAY_DEV_LOG

	if STATE_DISPLAY_DEV_LOG then
		InitializeDisplayDevLog()
	else
		DestroyDisplayDevLog()
	end
end