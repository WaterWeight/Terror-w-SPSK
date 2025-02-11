--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Dependencies
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

-- Events

-- Fires when player joins the game
Players.PlayerAdded:Connect(function(player)

    -- When adding charactr (player spawns in)
    player.CharacterAdded:Connect(function(character)

        -- When humanoid fires the .Died event (player died)
        character.Humanoid.Died:Connect(function()
            player:Kick("You've died stupid guy")
        end)
    end)
end)