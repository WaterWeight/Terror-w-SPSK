--!strict
local Players = game:GetService("Players")

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    local prompt = data.promptInstance :: ProximityPrompt

    local partToWeld = prompt.Parent

    print(Players:GetPlayers()[1])
end

return Item