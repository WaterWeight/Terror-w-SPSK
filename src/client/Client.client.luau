--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService  = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
-- Dependencies
local DirectionalMovement = require(ReplicatedStorage.Shared.DirectionalMovement)
local PromptHandler = require(ReplicatedStorage.Shared.PromptHandler)

local Packets = require(ReplicatedStorage.Shared:FindFirstChild("Packets"))

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

local mouse = player:GetMouse()

local sprintCooldown = 2

local keyBinds = {
    [Enum.KeyCode.LeftShift] = "Sprint",
    [Enum.KeyCode.LeftControl] = "Crouch"
}

local sprintDebounce = false
local crouchDebounce = false

-- Functionality

-- Mouse icon
mouse.Icon = "http://www.roblox.com/asset/?id=12920788753"

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

RunService.RenderStepped:Connect(DirectionalMovement.stepped)

-- UIS and Movement
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

-- When player is dying
Packets.onDied.listen(function(data : {}, player : Player)
    print("Client - Removing Character")
    sprintDebounce = false
    crouchDebounce = false

    local deathScreen = ReplicatedStorage.Assets:FindFirstChild("DeathScreen"):Clone() :: ScreenGui
    deathScreen.Parent = Players.LocalPlayer.PlayerGui

    local blurEffect = Lighting:FindFirstChild("ScreenBlur")
    local blurTween = TweenService:Create(blurEffect, TweenInfo.new(5), {Size = 24})
    blurTween:Play()

    task.wait(4)

    local screenTween = TweenService:Create(deathScreen.Frame.Text, TweenInfo.new(.2), {TextSize = 100})
    screenTween:Play()
end)

-- Prompt Handling

ProximityPromptService.PromptShown:Connect(PromptHandler.PromptShown)
ProximityPromptService.PromptHidden:Connect(PromptHandler.PromptHidden)

ProximityPromptService.PromptButtonHoldBegan:Connect(PromptHandler.PromptHoldBegan)