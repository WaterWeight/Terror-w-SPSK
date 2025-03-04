--!strict
--[[
System zajmujący się obsługiwaniem promptow
]]
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Items = ReplicatedStorage.Shared.Prompts

-- Local
local player = Players.LocalPlayer

local Prompt = {}

function Prompt.PromptShown(prompt : ProximityPrompt, inputType : Enum.ProximityPromptInputType)
    local promptParent : BasePart = prompt.Parent
    local billboardGui : BillboardGui = promptParent:FindFirstChild("Cosmetic")
    local guiMain : Frame = billboardGui:FindFirstChild("Main")

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

    -- Text
    local keyCode : TextLabel = guiMain:FindFirstChild("KeyCode")
    local objectText : TextLabel = guiMain:FindFirstChild("ObjectText")

    billboardGui.Enabled = false

    local beam : Beam = promptParent:FindFirstChild("Beam")
    beam.Attachment1 = nil
    beam.Enabled = false
end

function Prompt.PromptHoldBegan(prompt : ProximityPrompt, player : Player)
    local promptParent : BasePart = prompt.Parent
    local billboardGui : BillboardGui = promptParent:FindFirstChild("Cosmetic")
    local guiMain : Frame = billboardGui:FindFirstChild("Main")
    local fillFrame : Frame = guiMain:FindFirstChild("Fill")

    local fillTween = TweenService:Create(fillFrame, TweenInfo.new(prompt.HoldDuration), {Size = UDim2.fromScale(1,1)})
    fillTween:Play()

    local function promptHoldEnded()
        fillTween:Cancel()

        local unFillTween = TweenService:Create(fillFrame, TweenInfo.new(.1), {Size = UDim2.fromScale(1,0)})
        unFillTween:Play()
    end

    local function promptTriggered()
        print(prompt.Name .. " Prompt triggered")
    end

    ProximityPromptService.PromptButtonHoldEnded:Connect(promptHoldEnded)
    prompt.Triggered:Connect(promptTriggered)
end

return Prompt