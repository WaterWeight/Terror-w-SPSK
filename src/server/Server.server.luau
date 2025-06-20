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
    --print(data)

	local promptName = data.promptName :: string
	local prompt = data.promptInstance :: Instance

    if PromptItems[promptName] then
        local module = require(PromptItems[promptName])

        local extraPromptData = {
			name = promptName,
			promptInstance = prompt
        }

        module.Activated(extraPromptData)
    end
end

-- Events

-- Fires when player joins the game
Players.PlayerAdded:Connect(function(player : Player)
	
	if not game:GetService("RunService"):IsStudio() then
		local cloneGUI = ReplicatedStorage.Assets["LoadingGui-Fake"]:Clone()
		cloneGUI.Parent = player.PlayerGui
	end

    -- When adding character (player spawns in)
    player.CharacterAdded:Connect(function(character : Model?)

        -- When humanoid fires the .Died event (player died)
        character.Humanoid.Died:Connect(function()

            Packets.onDied.sendToAll({
                player = player,
            })

            task.wait(10)

            player:Kick("Character died")
        end)
    end)
end)

-- Prompts

Packets.promptTriggered.listen(promptTriggered)

ReplicatedStorage.DialogueEvents.DialogueEnd.onServerEvent:Connect(function()
    if Players:GetPlayers() then
        if Players:GetPlayers()[1].Character.Torso:FindFirstChild("DialogueWeld") then
                Players:GetPlayers()[1].Character.Torso.DialogueWeld:Destroy()
        end
    end
end)