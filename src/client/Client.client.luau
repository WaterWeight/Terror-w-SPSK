--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local UserInputService = game:GetService("UserInputService")
-- Dependencies
local DirectionalMovement = require(ReplicatedStorage.Shared.DirectionalMovement)

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local viewBobbingConnection

-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)


UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    
end)
UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    
end)
-- Prompt Handling