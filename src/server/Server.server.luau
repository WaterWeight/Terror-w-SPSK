--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Dependencies
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

-- Events

-- Fires when player joins the game
Players.PlayerAdded:Connect(function(player)

    -- When removing character (player dies)
    player.CharacterRemoving:Connect(function()
        player:Kick("You've died!!!! stupid ass fucker")
    end)
end)