--!strict
-- Service
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Event = ReplicatedStorage:WaitForChild("CutsceneRemoteEvent")
local Module = require(ReplicatedStorage:WaitForChild("Shared").CutscenesModule)

Event.OnClientEvent:Connect(function(operationType, part, time, easingStyle, easingDirection)
    if operationType == "Turn CS Camera On" then
        Players.LocalPlayer.PlayerScripts.Client.Client.Enabled = false
        Module.CSCameraOn(Players.LocalPlayer)
    elseif operationType == "Turn CS Camera Off" then
        Module.CSCameraOff(Players.LocalPlayer)
        Players.LocalPlayer.PlayerScripts.Client.Client.Enabled = true
    elseif operationType == "Tween CS Camera" then
        Module.CSTween(part, time, easingStyle, easingDirection)
    elseif  operationType == "Set CS Camera" then
        Module.CSSet(part, time)
    elseif operationType == "Set CS Camera to Part" then
        Module.CSSetToObject(part, time)
    end
end)

--Module.CSCameraOn(Player)
--Module.CSTween(Workspace:WaitForChild("Test1"), 5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
--Introduction
--Module.CSSet(CSFolder.Introduction[1], 5)
--CSFolder.Introduction[1]:Destroy()
--Module.CSSet(CSFolder.Introduction[2], 5)