--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Dependencies
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)

-- Events

-- Fires when player joins the game
Players.PlayerAdded:Connect(function(player : Player)
	
	local cloneGUI = ReplicatedStorage.Assets["LoadingGui-Fake"]:Clone()
	cloneGUI.Parent = player.PlayerGui

    -- When adding charactr (player spawns in)
    player.CharacterAdded:Connect(function(character : Model?)

        -- When humanoid fires the .Died event (player died)
        character.Humanoid.Died:Connect(function()
            player:Kick("You've died stupid fellow")
        end)
    end)
end) --twatwata