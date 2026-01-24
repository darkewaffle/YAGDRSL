function GetPartyMemberHP(TargetID)
	local PartyMembers = windower.ffxi.get_party()
	
	for _, PartyMember in pairs(PartyMembers) do
		if type(PartyMember) == "table" then
			if PartyMember["mob"] then
				if PartyMember["mob"]["id"] == TargetID then
					return PartyMember["hp"]
				end
			end
		end
	end

	return 0
end

function GetPartyMemberMissingHP(TargetID)
	local PartyMembers = windower.ffxi.get_party()
	
	for _, PartyMember in pairs(PartyMembers) do
		if type(PartyMember) == "table" then
			if PartyMember["mob"] then
				if PartyMember["mob"]["id"] == TargetID then

					local CurrentHP = PartyMember["hp"]
					ChatError(CurrentHP)
					local MaxHP = math.floor(CurrentHP/(PartyMember["hpp"]/100))
					ChatError(MaxHP)
					local MissingHP = Clamp(MaxHP - CurrentHP, 0, 9999)
					ChatError(MissingHP)
					return MissingHP

				end
			end
		end
	end

	return 0
end