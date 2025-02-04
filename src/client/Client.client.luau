--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
-- Dependencies
local directionalMovement = require(ReplicatedStorage.Shared.directionalMovement)

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Events
RunService.RenderStepped:Connect(directionalMovement.stepped)

-- Prompt Handling
ProximityPromptService.PromptShown:Connect()
ProximityPromptService.PromptHidden:Connect()
ProximityPromptService.PromptButtonHoldBegan:Connect()
ProximityPromptService.PromptButtonHoldEnded:Connect()