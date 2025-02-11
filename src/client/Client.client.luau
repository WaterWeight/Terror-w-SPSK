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

local keyCodes = {
    
}

local sprintDebounce = false

-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)


UserInputService.InputBegan:Connect(function(_input, _gameProcessedEvent)
    print("Client - Input Began" .. _input)
end)
UserInputService.InputEnded:Connect(function(_input, _gameProcessedEvent)
    print("Client - Input Ended" .. _input)
end)

player.CharacterRemoving:Connect(function(character)
    print("Client - Removing Character")
    sprintDebounce = false
end)
-- Prompt Handling