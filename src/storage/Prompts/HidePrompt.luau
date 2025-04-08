--!strict
local Players = game:GetService("Players")

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    local prompt = data.promptInstance :: ProximityPrompt

    local partToWeld = prompt.Parent :: Part

    local character = Players:GetPlayers()[1].Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") :: Part

    character:PivotTo(partToWeld.CFrame)

    humanoidRootPart.Anchored = true
end

return Item