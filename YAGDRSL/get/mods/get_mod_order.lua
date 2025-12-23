-- ModOrder___ tables are declared by the library and should be defined by the user to specify in what order mods should be combined into a gearset.
-- These functions return the appropriate table depending on event/status parameters.

function GetEventModOrder(SpellAttributes, EventSource, ModClass)

	local OffenseModOrder = {}
	local DefenseModOrder = {}

	if EventSource == EVENT_PRECAST then

		if SpellAttributes["Category"] == CATEGORY_JA then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_JA_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_JA_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_MAGIC then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_MAGIC_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_MAGIC_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_RA then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_RA_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_RA_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_WS then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_WS_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_WS_DEFENSE]
		end

	elseif EventSource == EVENT_MIDCAST then
		
		if SpellAttributes["Category"] == CATEGORY_JA then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_JA_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_JA_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_MAGIC then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_MAGIC_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_MAGIC_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_RA then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_RA_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_MIDCAST_RA_DEFENSE]

		elseif SpellAttributes["Category"] == CATEGORY_WS then
			OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_WS_OFFENSE]
			DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_PRECAST_WS_DEFENSE]
		end
	end

	if ModClass == MOD_CLASS_OFFENSE then
		return OffenseModOrder
	elseif ModClass == MOD_CLASS_DEFENSE then
		return DefenseModOrder
	else
		return nil
	end
end

function GetStatusModOrder(CharacterStatus, ModClass)

	local OffenseModOrder = {}
	local DefenseModOrder = {}

	if CharacterStatus == STATUS_ENGAGED then

		OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_ENGAGED_OFFENSE]
		DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_ENGAGED_DEFENSE]

	elseif CharacterStatus == STATUS_IDLE then

		OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_IDLE_OFFENSE]
		DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_IDLE_DEFENSE]

	elseif CharacterStatus == STATUS_RESTING then

		OffenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_RESTING_OFFENSE]
		DefenseModOrder = _G[MOD_ORDER_CONTAINER][MOD_ORDER_STATUS_RESTING_DEFENSE]

	end

	if ModClass == MOD_CLASS_OFFENSE then
		return OffenseModOrder
	elseif ModClass == MOD_CLASS_DEFENSE then
		return DefenseModOrder
	else
		return nil
	end
end

function GetModOrderList(ModClass)
	local OrderList = {}
	
	if ModClass == MOD_CLASS_DEFENSE then
		OrderList = _G[MOD_ORDER_LIST_DEFENSE]
	elseif ModClass == MOD_CLASS_OFFENSE then
		OrderList = _G[MOD_ORDER_LIST_OFFENSE]
	end

	return OrderList
end

function GetModOrderListOffense()
	return GetModOrderList(MOD_CLASS_OFFENSE)
end

function GetModOrderListDefense()
	return GetModOrderList(MOD_CLASS_DEFENSE)
end