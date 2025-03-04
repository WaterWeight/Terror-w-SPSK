--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local UserInputService = game:GetService("UserInputService")
-- Dependencies
local DirectionalMovement = require(ReplicatedStorage.Shared.DirectionalMovement)
local PromptHandler = require(ReplicatedStorage.PromptHandler)

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

local sprintCooldown = 2

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
        if sprintDebounce == true then return end
        humanoid.WalkSpeed = 16
        sprintDebounce = true
    else
        -- NO RUNNING1!! NO NO NO NO NO
        humanoid.WalkSpeed = 10
        task.wait(sprintCooldown)
        sprintDebounce = false
    end
end

local function crouch(status : boolean)
    if crouchDebounce == true then return end

    if status == true then
        
    else
        
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
        elseif code == "Crouch" then
            crouch(true)
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
        elseif code == "Crouch" then
            crouch(false)
        end
    end
end)

player.CharacterRemoving:Connect(function(character : Model?)
    print("Client - Removing Character")
    sprintDebounce = false
    crouchDebounce = false
end)
-- Prompt Handling

ProximityPromptService.PromptShown:Connect(PromptHandler.PromptShown)