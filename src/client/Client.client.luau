--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Dependencies
local directionalMovement = require(ReplicatedStorage.Shared.directionalMovement)

-- Local
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Events
RunService.RenderStepped:Connect(directionalMovement.stepped)