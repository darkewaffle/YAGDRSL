local MATH_TAU = 2*math.pi

function Clamp(Input, MinValue, MaxValue)
	local ClampedValue = Input
	ClampedValue = math.min(ClampedValue, MaxValue)
	ClampedValue = math.max(ClampedValue, MinValue)
	return ClampedValue
end


-- The logic used in NormalizeRadians and NormalizeDegrees is incomplete if handling values outside the -pi to pi or -360 to 360 range.
-- I don't think Windower produces anything outside those ranges though so it should be sufficient.
function NormalizeRadians(RadianValue)
	if RadianValue < 0 then
		RadianValue = RadianValue + MATH_TAU
	end

	RadianValue = Clamp(RadianValue, 0, MATH_TAU)
	return RadianValue
end

function NormalizeDegrees(DegreeValue)
	if DegreeValue < 0 then
		DegreeValue = DegreeValue + 360
	end

	DegreeValue = Clamp(DegreeValue, 0, 360)
	return DegreeValue
end

function RadiansToDegrees(RadianValue)
	RadianValue = NormalizeRadians(RadianValue)

	local Degrees = RadianValue * 57.2958
	Degrees = NormalizeDegrees(Degrees)

	return Degrees
end

function DegreesToRadians(DegreeValue)
	DegreeValue = NormalizeDegrees(DegreeValue)

	local Radians = DegreeValue * 0.0174533
	Radians = NormalizeRadians(Radians)

	return Radians
end
