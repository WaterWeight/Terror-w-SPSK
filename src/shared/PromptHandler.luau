--!strict
--[[
System zajmujący się obsługiwaniem promptow
]]
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")

local Prompt = {}

function Prompt.PromptShown(prompt : ProximityPrompt, inputType : Enum.ProximityPromptInputType)
    local promptParent = prompt.Parent
    local billboardGui = promptParent:FindFirstChild("Cosmetic") :: BillboardGui
    local guiMain = billboardGui:FindFirstChild("Main") :: Frame
    local fillFrame = guiMain:FindFirstChild("Fill") :: Frame

    -- Text
    local keyCode = guiMain:FindFirstChild("KeyCode") :: TextLabel
    local objectText = guiMain:FindFirstChild("ObjectText") :: TextLabel

    billboardGui.Enabled = true
end

function Prompt.PromptHidden(prompt : ProximityPrompt)
    local promptParent = prompt.Parent
    local billboardGui = promptParent:FindFirstChild("Cosmetic") :: BillboardGui
    local guiMain = billboardGui:FindFirstChild("Main") :: Frame
    local fillFrame = guiMain:FindFirstChild("Fill") :: Frame

    -- Text
    local keyCode = guiMain:FindFirstChild("KeyCode") :: TextLabel
    local objectText = guiMain:FindFirstChild("ObjectText") :: TextLabel

    billboardGui.Enabled = false
end

function promptButtonHold(prompt : ProximityPrompt, player : Player)
    
end

return Prompt