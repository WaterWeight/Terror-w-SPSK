--!strict
task.wait(3)
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
-- Dependencies
local DirectionalMovement = require(ReplicatedStorage.Shared.DirectionalMovement)
local ViewBobbing = require(ReplicatedStorage.Shared.ViewBobbing)

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local viewBobbingConnection

-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)

player.CharacterAdded:Connect(function(character)
    viewBobbingConnection = RunService.RenderStepped:Connect(ViewBobbing.bob)
end)
player.CharacterRemoving:Connect(function(character)
    viewBobbingConnection:Disconnect
end)

-- Prompt Handling
ProximityPromptService.PromptShown:Connect()
ProximityPromptService.PromptHidden:Connect()
ProximityPromptService.PromptButtonHoldBegan:Connect()
ProximityPromptService.PromptButtonHoldEnded:Connect()