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
					local MaxHP = math.floor(CurrentHP/(PartyMember["hpp"]/100))
					local MissingHP = Clamp(MaxHP - CurrentHP, 0, 9999)
					return MissingHP

				end
			end
		end
	end

	return 0
end