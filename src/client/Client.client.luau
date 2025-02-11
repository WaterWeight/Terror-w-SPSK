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

local keyBinds = {
    [Enum.KeyCode.LeftShift] = "Sprint",
}

local sprintDebounce = false

-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)


UserInputService.InputBegan:Connect(function(input, _gameProcessedEvent)
    if _gameProcessedEvent then return end

    local code = keyBinds[input.KeyCode]
    if code then
        print(code)
    end
end)
UserInputService.InputEnded:Connect(function(input, _gameProcessedEvent)
    if _gameProcessedEvent then return end
    local code = keyBinds[input.KeyCode]
    if code then
        print(code)
    end
end)

player.CharacterRemoving:Connect(function(character)
    print("Client - Removing Character")
    sprintDebounce = false
end)
-- Prompt Handling