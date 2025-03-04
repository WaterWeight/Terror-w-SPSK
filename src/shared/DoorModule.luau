local module = {}

local WeldModule = require(game.ReplicatedStorage.Shared.WeldModule)

function module.DoorMovementCreationOperation(model)
	for i,v in model:GetChildren() do
		if not v:IsA("Script") and v ~= model.PrimaryPart and v.Name ~= "M2" and not v:IsA("Model") then
			WeldModule.Weld(v, model.PrimaryPart, v, v.Name.."Weld")
			v.Anchored = false
		end
	end
end

function module.DoorOpeningOperaion(StatusValue, HingeMotor, HandleMotor)
	if StatusValue.Value == true then
        HandleMotor.DesiredAngle = .6
		HingeMotor.DesiredAngle = 1.6
        wait(.5)
        HandleMotor.DesiredAngle = 0
	else
        HandleMotor.DesiredAngle = 0
		HingeMotor.DesiredAngle = 0
	end
end


return module
