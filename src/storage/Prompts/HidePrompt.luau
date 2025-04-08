--!strict
local Players = game:GetService("Players")
local player = Players[1] :: Player

local Item = {}

function Item.Activated(data : {})
    print("HidePrompt.luau activated")
    
    local prompt = data.promptInstance :: ProximityPrompt

    local partToWeld = prompt.Parent :: Part

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    character:PivotTo(partToWeld.CFrame)
end

return Item