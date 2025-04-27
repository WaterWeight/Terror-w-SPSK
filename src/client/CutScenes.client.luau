--!strict
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local Event = ReplicatedStorage:WaitForChild("CutsceneRemoteEvent")
local Module = require(ReplicatedStorage:WaitForChild("Shared").CutscenesModule)

Event.OnClientEvent:Connect(function()
    Module.CSCameraOn(Player)
    Module.CSTween(Workspace:WaitForChild("Test1"), 5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    Module.CSTween(Workspace:WaitForChild("Test2"), 5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
end)