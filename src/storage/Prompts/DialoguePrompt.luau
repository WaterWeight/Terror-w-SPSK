--!strict

local ReplicatedStorage = game.ReplicatedStorage
local Players = game.Players
local WeldModule = require(ReplicatedStorage.Shared.WeldModule)

local Item = {}
local DialogueEvents = ReplicatedStorage.DialogueEvents

function Item.Activated(data : {})
	local Prompt = data.promptInstance
	local MyDialogue = Prompt.Parent.Dialogue --True = open False = closed
	local Weld = Instance.new("Weld", Players:GetPlayers()[1].Character.Torso)
	Weld.Name = "DialogueWeld"
	Weld.Part0 = MyDialogue.Speaker.Value.Torso
	Weld.Part1 = Players:GetPlayers()[1].Character.Torso
	Weld.C0 = CFrame.new(0, 0, -3) * CFrame.Angles(0,math.rad(180), 0)

	DialogueEvents.DialogueRemote:FireAllClients(MyDialogue)

end

return Item