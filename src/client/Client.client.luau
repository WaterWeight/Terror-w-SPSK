--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Dependencies
local directionalMovement = require(ReplicatedStorage.Shared.directionalMovement)

-- Events
RunService.RenderStepped:Connect(directionalMovement.stepped)