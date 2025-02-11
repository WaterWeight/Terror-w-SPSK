--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Dependencies
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

-- Events
Players.PlayerAdded:Once(function(Player)
    local clonedGUI = ReplicatedStorage.Assets["LoadingGui-Fake"]:Clone() 
	clonedGUI.Parent = Player.PlayerGui
end)