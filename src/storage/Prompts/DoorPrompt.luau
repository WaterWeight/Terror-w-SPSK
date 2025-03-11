--!strict

local Item = {}

function Item.Activated(data : {})
	local Prompt = data.promptInstance
	local DoorStatus = Prompt.Parent.Parent.Script.Status --True = open False = closed

	if DoorStatus.Value == true then
		DoorStatus.Value = false
	else
		DoorStatus.Value = true
	end

end

return Item