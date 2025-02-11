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
    [Enum.KeyCode.LeftControl] = "Crouch"
}

local sprintDebounce = false
local crouchDebounce = false
-- Functions
local function sprint(status : boolean)
    
end
-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)


UserInputService.InputBegan:Connect(function(input, _gameProcessedEvent)
    if _gameProcessedEvent then return end
    print(typeof(_gameProcessedEvent))
    print(typeof(input))
    local code = keyBinds[input.KeyCode]
    if code then
        print(code .. "Input Began")
    end
end)
UserInputService.InputEnded:Connect(function(input, _gameProcessedEvent)
    if _gameProcessedEvent then return end
    local code = keyBinds[input.KeyCode]
    if code then
        print(code .. "Input Ended")
    end
end)

player.CharacterRemoving:Connect(function(character)
    print("Client - Removing Character")
    sprintDebounce = false
    crouchDebounce = false
end)
-- Prompt Handling