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

-- Events
RunService.RenderStepped:Connect(DirectionalMovement.stepped)

RunService.RenderStepped:Connect(ViewBobbing.bob)

-- Prompt Handling
ProximityPromptService.PromptShown:Connect()
ProximityPromptService.PromptHidden:Connect()
ProximityPromptService.PromptButtonHoldBegan:Connect()
ProximityPromptService.PromptButtonHoldEnded:Connect()