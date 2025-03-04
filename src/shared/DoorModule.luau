local module = {}

local WeldModule = require(game.ReplicatedStorage.Assets.WeldModule)

function module.DoorMovementCreationOperation(model)
	for i,v in model:GetChildren() do
		if not v:IsA("Script") and v ~= model.PrimaryPart and v.Name ~= "M2" then
			WeldModule.Weld(v, model.PrimaryPart, v, v.Name.."Weld")
			v.Anchored = false
		end
	end
end

function module.DoorOpeningOperaion(StatusValue, HingeMotor, Handle)
	if StatusValue.Value == true then
		HingeMotor.DesiredAngle = 1.6
	else
		HingeMotor.DesiredAngle = 0
	end
end


return module
