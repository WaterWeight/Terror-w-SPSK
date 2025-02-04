--!strict
-- Service
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Dependencies
local directionalMovement = require(ReplicatedStorage.Shared.directionalMovement)

RunService.RenderStepped:Connect()