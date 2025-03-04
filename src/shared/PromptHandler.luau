--!strict
--[[
System zajmujący się obsługiwaniem promptow
]]
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Players = game:GetService("Players")

-- Local
local player = Players.LocalPlayer

local Prompt = {}

function Prompt.PromptShown(prompt : ProximityPrompt, inputType : Enum.ProximityPromptInputType)
    local promptParent : BasePart = prompt.Parent
    local billboardGui : BillboardGui = promptParent:FindFirstChild("Cosmetic")
    local guiMain : Frame = billboardGui:FindFirstChild("Main")
    local fillFrame : Frame = guiMain:FindFirstChild("Fill")

    -- Text
    local keyCode : TextLabel = guiMain:FindFirstChild("KeyCode")
    local objectText : TextLabel = guiMain:FindFirstChild("ObjectText")

    billboardGui.Enabled = true

    -- Beam operations

    local character : Model? = player.Character

    local beam : Beam = promptParent:FindFirstChild("Beam")
    beam.Attachment1 = character:FindFirstChild("HumanoidRootPart"):FindFirstChild("RootAttachment")

    beam.Enabled = true
end

function Prompt.PromptHidden(prompt : ProximityPrompt)
    local promptParent : BasePart = prompt.Parent
    local billboardGui : BillboardGui = promptParent:FindFirstChild("Cosmetic")
    local guiMain : Frame = billboardGui:FindFirstChild("Main")
    local fillFrame : Frame = guiMain:FindFirstChild("Fill")

    -- Text
    local keyCode : TextLabel = guiMain:FindFirstChild("KeyCode")
    local objectText : TextLabel = guiMain:FindFirstChild("ObjectText")

    billboardGui.Enabled = false
end

function promptButtonHold(prompt : ProximityPrompt, player : Player)
    
end

return Prompt