--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
-- Dependencies
local ByteNet = require(ReplicatedStorage.Dependencies.ByteNet)
local Packets = require(ReplicatedStorage.Shared.Packets)

local PromptItems = ServerStorage.Storage.Prompts

-- Functions

local function promptTriggered(data : {}, player : Player)
    print(data)

    local promptName = data.promptName :: string

    if PromptItems[promptName] then
        local module = require(PromptItems[promptName])

        local extraPromptData = {
            name = promptName
        }

        module.Activated(extraPromptData)
    end
end

-- Events

-- Fires when player joins the game
Players.PlayerAdded:Connect(function(player : Player)
	
	local cloneGUI = ReplicatedStorage.Assets["LoadingGui-Fake"]:Clone()
	cloneGUI.Parent = player.PlayerGui

    -- When adding character (player spawns in)
    player.CharacterAdded:Connect(function(character : Model?)

        -- When humanoid fires the .Died event (player died)
        character.Humanoid.Died:Connect(function()

            local deathScreen = ReplicatedStorage.Assets:FindFirstChild("DeathScreen"):Clone()
            deathScreen.Parent = player.PlayerGui

            

            player:Kick("Character died")
        end)
    end)
end)

-- Prompts

Packets.promptTriggered.listen(promptTriggered)