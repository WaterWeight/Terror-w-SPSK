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
local humanoid = character:FindFirstChildOfClass("Humanoid")

local keyBinds = {
    [Enum.KeyCode.LeftShift] = "Sprint",
    [Enum.KeyCode.LeftControl] = "Crouch"
}

local sprintDebounce = false
local crouchDebounce = false
-- Functions
local function sprint(status : boolean)
    if status == true then
        -- Running
        humanoid.WalkSpeed = 45
    else
        -- NO RUNNING1!! NO NO NO NO NO
        humanoid.WalkSpeed = 16
    end
end
-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)


UserInputService.InputBegan:Connect(function(input : Instance, _gameProcessedEvent : boolean)
    if _gameProcessedEvent then return end
    local code = keyBinds[input.KeyCode]
    if code then
        print(code .. "Input Began")
        if code == "Sprint" then
            sprint(true)
        end
    end
end)
UserInputService.InputEnded:Connect(function(input : Instance, _gameProcessedEvent : boolean)
    if _gameProcessedEvent then return end
    local code = keyBinds[input.KeyCode]
    if code then
        print(code .. "Input Ended")
        if code == "Sprint" then
            sprint(false)
        end
    end
end)

player.CharacterRemoving:Connect(function(character)
    print("Client - Removing Character")
    sprintDebounce = false
    crouchDebounce = false
end)
-- Prompt Handling